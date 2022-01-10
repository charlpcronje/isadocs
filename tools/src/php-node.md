# 3. PHP Node

This is quite an old open source script but I thought it could be handy one day

The node.php installs node, starts server 192.168.9.44:9999 with provided JS file and creates a proxy for all node requests.

## 3.1 Make sure the following set

- PHP Safe mode off
- Functions enabled: `curl_exec`, `exec`, `passthru`.

## 3.21 How to run

 1. Put the `node.php` file in your `public_html` (or similar) folder, then install node.js by browsing to: `http://example.org/node.php?install`.
 2. When succeeded, install your node.js app by uploading its folder or using npm: `http://example.org/node.php?npm=install jt-js-sample`.
 3. When everything goes fine, start your node.js instance by going to: `http://example.org/node.php?start=node_modules/jt-js-sample/index.js`.
 4. Now you can request your app by browsing to: `http://example.org/node.php?path=optional/request/path`. This will return a response from the running node.js app at `http://192.168.9.55:9999/optional/request/path`.
 5. Finally, stop your node.js server by loading: `http://example.org/node.php?stop`.

## 3.3 Commands

- `node.php[?path=some/path]` - serves an already running node.js app with an optional request path (no leading slash)

The following commands require the `ADMIN_MODE` set to `true` (line 13 of `node.php`): or add `?mode=admin` to url

- `node.php?install` - downloads and extracts node.js into the `node` folder.
- `node.php?uninstall` - removes the `node` folder
- `node.php?start=node_modules/jt-js-sample/index.js` - starts a node.js server running the provided `index.js` file
- `node.php?stop` - stops a running node.js server
- `node.php?npm=install jt-js-sample` - runs `npm install jt-js-sample` (*may be dangerous!*)

## 3.4 Some help maybe?

In order to troubleshoot any problems with running node.php, connect to your host using SSH and run exact node.php commands manually:

1. Go to your document root directory (often `~/public_html/`) and check if `node` directory exists there.
2. If yes, go to step 3, otherwise download node for your architecture:
    
```shell
wget http://nodejs.org/dist/node-v5.7.0-linux-x86.tar.gz
tar -xzf node-v5.7.0-linux-x86.tar.gz
mv node-v5.7.0-linux-x86/ node/
rm -f node-v5.7.0-linux-x86.tar.gz
```
    
3. Run node on port 9999 (or other): `PORT=9999 node/bin/node [path/to/index.js] &`
4. Connect to node instance: `curl http://192.168.9.55:9999/[some/path]`
5. If you get the HTML response, the problem most probably lies in PHP and its permissions.
6. Kill node process: `killall node`