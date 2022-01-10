<?php
error_reporting(E_ALL);
set_time_limit(300);

/**
 * Update 2018-10-10 Charl Cronje Also look at changeMode function near the bottom, 
 * not the nicest but I got sick of editing this file and changing the mode, should add config file some day 
 */
 
define("ADMIN_MODE", true); //set to true to allow unsafe operations, set back to false when finished
define("NODE_VER", "v16.13.1");
define("NODE_ARCH", "x" . substr(php_uname("m"), -2)); //x86 or x64
define("NODE_FILE", "node-" . NODE_VER . "-linux-" . NODE_ARCH . ".tar.gz");
define("NODE_URL", "http://nodejs.org/dist/" . NODE_VER . "/" . NODE_FILE);
define("NODE_DIR", "node");
define("NODE_PORT", 9999);

function nodeInstall() {
	if(file_exists(NODE_DIR)) {
		echo "Node.js is already installed.\n";
		return;
	}
	if(!file_exists(NODE_FILE)) {
		echo "Downloading Node.js from " . NODE_URL . ":\n\n";
		$fp = fopen(NODE_FILE, "w");
		flock($fp, LOCK_EX);
		$curl = curl_init(NODE_URL);
		curl_setopt($curl, CURLOPT_HEADER, 0);
		curl_setopt($curl, CURLOPT_FILE, $fp);
		$resp = curl_exec($curl);
		curl_close($curl);
		flock($fp, LOCK_UN);
		fclose($fp);
		echo $resp === true ? "Done.\n" : "Failed. Error: curl_error($curl)\n";
	}
	echo "Installing Node.js:\n";
	passthru("tar -xzf " . NODE_FILE . " 2>&1 && mv node-" . NODE_VER . "-linux-" . NODE_ARCH . " " . NODE_DIR . " && touch nodepid && rm -f " . NODE_FILE, $ret);
	echo $ret === 0 ? "Done.\n" : "Failed. Error: $ret\nTry putting node folder via (S)FTP, so that " . __DIR__ . "/node/bin/node exists.";
}

function nodeUninstall() {
	if(!file_exists(NODE_DIR)) {
		echo "Node.js is not yet installed.\n";
		return;
	}
	echo "Unnstalling Node.js:\n";
	passthru("rm -rfv " . NODE_DIR . " nodepid", $ret);
	passthru("rm -rfv node_modules", $ret);
	passthru("rm -rfv .npm", $ret);
	passthru("rm -rfv nodeout", $ret);
	echo $ret === 0 ? "Done.\n" : "Failed. Error: $ret\n";
}

function nodeStart($file) {
	if(!file_exists(NODE_DIR)) {
		echo "Node.js is not yet installed. <a href='?install'>Install it</a>.\n";
		return;
	}
	$nodePid = intval(file_get_contents("nodepid"));
	if($nodePid > 0) {
		echo "Node.js is already running. <a href='?stop'>Stop it</a>.\n";
		return;
	}
	$file = escapeshellarg($file);
	echo "Starting: node $file\n";
	$nodePid = exec("PORT=" . NODE_PORT . " " . NODE_DIR . "/bin/node $file >nodeout 2>&1 & echo $!");
	echo $nodePid > 0 ? "Done. PID=$nodePid\n" : "Failed.\n";
	file_put_contents("nodepid", $nodePid, LOCK_EX);
	sleep(1); //Wait for node to spin up
	echo file_get_contents("nodeout");
}

function nodeStop() {
	if(!file_exists(NODE_DIR)) {
		echo "Node.js is not yet installed. <a href='?install'>Install it</a>.\n";
		return;
	}
	$nodePid = intval(file_get_contents("nodepid"));
	if($nodePid === 0) {
		echo "Node.js is not yet running.\n";
		return;
	}
	echo "Stopping Node.js with PID=$nodePid:\n";
	$ret = -1;
	passthru("kill $nodePid", $ret);
	echo $ret === 0 ? "Done.\n" : "Failed. Error: $ret\n";
	file_put_contents("nodepid", '', LOCK_EX);
}

function nodeNpm($cmd) {
	if(!file_exists(NODE_DIR)) {
		echo "Node.js is not yet installed. <a href='?install'>Install it</a>.\n";
		return;
	}
	$cmd = escapeshellcmd(NODE_DIR . "/bin/npm --cache ./.npm -- $cmd");
	echo "Running: $cmd\n";
	$ret = -1;
	passthru($cmd, $ret);
	echo $ret === 0 ? "Done.\n" : "Failed. Error: $ret. See <a href=\"npm-debug.log\">npm-debug.log</a>\n";
}

function nodeServe($path = "") {
	if(!file_exists(NODE_DIR)) {
		nodeHead();
		echo "Node.js is not yet installed. Switch to Admin Mode and <a href='?install'>Install it</a>.\n";
		nodeFoot();
		return;
	}
	$nodePid = intval(file_get_contents("nodepid"));
	if($nodePid === 0) {
		nodeHead();
		echo "Node.js is not yet running. Switch to Admin Mode and <a href='?start'>Start it</a>\n";
		nodeFoot();
		return;
	}
	$curl = curl_init("http://127.0.0.1:" . NODE_PORT . "/$path");
	curl_setopt($curl, CURLOPT_HEADER, 1);
	curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        $headers = array();
        foreach(getallheaders() as $key => $value) {
                $headers[] = $key . ": " . $value;
        }
        curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, $_SERVER["REQUEST_METHOD"]);
        if($_SERVER["REQUEST_METHOD"] === "POST") {
                curl_setopt($curl, CURLOPT_POST, 1);
                curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($_POST));
        }
 	$resp = curl_exec($curl);
	if($resp === false) {
		nodeHead();
		echo "Error requesting $path: " . curl_error($curl);
		nodeFoot();
	} else {
		list($head, $body) = explode("\r\n\r\n", $resp, 2);
		$headArr = explode("\n", $head);
		foreach($headArr as $headVal) {
			header($headVal);
		}
		echo $body;
	}
	curl_close($curl);
}

function nodeHead() {
	echo '<!DOCTYPE html><html><head><title>Node.php</title><meta charset="utf-8"><body style="font-family:Helvetica,sans-serif;"><h1>Node.php</h1><pre>';
}

function nodeFoot() {
	echo '</pre><p><a href="https://github.com/niutech/node.php" target="_blank">Powered by node.php</a></p></body></html>';
}

function switchMode() {
    $nodePhp = file_get_contents('node.php');
    if(ADMIN_MODE) {
        $newNodePhpContest = str_replace('define("ADMIN_MODE", true);','define("ADMIN_MODE", false);',$nodePhp);
    } else {
        $newNodePhpContest = str_replace('define("ADMIN_MODE", false);','define("ADMIN_MODE", true);',$nodePhp);
    }
    file_put_contents('node.php',$newNodePhpContest);
}

function nodeDispatch() {
	if(ADMIN_MODE) {
		nodeHead();
		if(isset($_GET['install'])) {
			nodeInstall();
		} elseif(isset($_GET['uninstall'])) {
			nodeUninstall();
		} elseif(isset($_GET['start'])) {
			nodeStart($_GET['start']);
		} elseif(isset($_GET['stop'])) {
			nodeStop();
		} elseif(isset($_GET['npm'])) {
			nodeNpm($_GET['npm']);
		} else {
			echo "You are in Admin Mode. Switch back to normal mode to serve your node app.";
		}
		nodeFoot();
	} else {
		if(isset($_GET['path'])) {
			nodeServe($_GET['path']);
		} else {
			nodeServe();
		}
	}
}
nodeDispatch();

// 
if ($_GET['mode'] == 'admin' && !ADMIN_MODE) {
    switchMode();
} else if (!isset($_GET['mode']) && ADMIN_MODE) {
    switchMode();
}