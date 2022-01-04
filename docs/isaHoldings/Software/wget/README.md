# wget Download and usage examples

## Download Wget on Windows

To install and configure wget for Windows:

1. [Download wget for Windows](https://eternallybored.org/misc/wget/)and install the package.
1. Copy the`wget.exe` file into your `C:\Windows\System32` folder.
1. Open the**command prompt**(cmd.exe) and run**`wget`** to see if it is installed.

Here is a quick video showing you how to download wget on windows 10.

## Wget Basics

Let’s look at the wget syntax, view the basic commands structure and understand the most important options.

### Wget Syntax

Wget has two arguments: **[OPTION]** and **[URL]**.

`wget [OPTION]... [URL]...`

- **`[OPTION]`** tells what to do with the **`[URL]`**argument provided after. It has a short and a long-form (ex: `-V` and `--version` are doing the same thing).
- **`[URL]`** is the file or the directory you wish to download.
- You can call many OPTIONS or URLs at once.

### View WGET commands

To view available wget commands, use `wget -h`.

Extract Web pages with Wget Commands

### Download a single file

`$ wget https://example.com/robots.txt`

### Download a File to a Specific Output Directory

Here replace `<YOUR-PATH>` by the output directory location where you want to save the file.

`$ wget ‐P &lt;YOUR-PATH&gt; https://example.com/sitemap.xml`

### Rename Downloaded File

To output the file with a different name:

`$ wget -O &lt;YOUR-FILENAME.html&gt; https://example.com/file.html`

### Define User Agent

Identify yourself. Define your user-agent.

`$ wget --user-agent=Chrome https://example.com/file.html`

### Extract as Google bot

`$ wget --user-agent="Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)" https://example.com/path`

### Extract Robots.txt only When it Changes

Let’s extract robots.txt only if the latest version in the server is more recent than the local copy.

[You Might Also Like Python Script Automation Using Task Scheduler (Windows)](https://www.jcchouinard.com/python-automation-using-task-scheduler/)

First time that you extract use `-S` to keep a timestamps of the file.

`$ wget -S https://example.com/robots.txt`

Later, to check if the robots.txt file has changed, and download it if it has.

`$ wget -N https://example.com/robots.txt`

### Convert Links on a Page

Convert the links in the HTML so they still work in your local version.(ex: `example.com/path` to `localhost:8000/path`)

`$ wget --convert-links https://example.com/path`

### Mirror a Single Webpage

To mirror a single web page so that it can work on your local.

`$ wget -E -H -k -K -p --convert-links https://example.com/path`

### Extract Multiple URLs

Add all urls in a `urls.txt` file.

`https://example.com/1`

`$ wget -i urls.txt`

### Limit Speed

To be a good citizen of the web, it is important not to crawl too fast by using `--wait` and `--limit-rate`.

- `--wait=1`: Wait 1 second between extractions.
- `--limit-rate=10K`: Limit the download speed (bytes per second)

### Extract Entire Site (Proceed with Caution)

Recursive mode extract a page, and follows the links on the pages to extract them as well.

This is extracting your entire site and can put extra load on your server. Be sure that you know what you do or that you involve the dev's.

`$ wget --recursive --page-requisites --adjust-extension --span-hosts --wait=1 --limit-rate=10K --convert-links --restrict-file-names=windows --no-clobber --domains example.com --no-parent example.com`

- `--recursive`: Follow links in the document. The maximum depth is 5.
- `--page-requisites`: Get all assets (CSS/JS/images)
- `--adjust-extension`: Save files with .html at the end.
- `--span-hosts`: Include necessary assets from offsite as well.
- `--wait=1`: Wait 1 second between extractions.
- `--limit-rate=10K`: Limit the download speed (bytes per second)
- `--convert-links`: Convert the links in the HTML so they still work in your local version.
- `--restrict-file-names=windows`: Modify filenames to work in Windows.
- `--no-clobber`: Overwrite existing files.
- `--domains example.com`: Do not follow links outside this domain.
- `--no-parent`: Do not ever ascend to the parent directory when retrieving recursively
- `--level`: Specify the depth of crawling. `inf` is used for infinite.

You Might Also Like Simple [.gitignore Template](https://www.jcchouinard.com/gitignore-template/)

### (Extra) Run Spider Mode

`$ wget --spider -r https://example.com -o wget.log`

### Wget VS Curl

Wget’s strength compared to`curl`is its **ability to download recursively**. This means that it will download a document, then follow the links and then download those documents as well.

### Use Wget With Python

Wget is strictly command line, but there is a package that you can import the `wget` package that mimics wget.

`import` `wget`url </code>`=`'https://www.jcchouinard.com/robots.txt'`filename`=`wget.download(url)`filename

### Debug Wget Command Not Found

If you get the `-bash: wget: command not found` error on Mac, Linux or Windows, it means that the wget GNU is either not installed or does not work properly
