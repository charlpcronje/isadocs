# Fortinet FortiWeb Agent

- When I stated yesterday afternoon I had almost no knowledge about `perl`, `perl` modules, `sub-routines`. How `includes` works. I did not know how the vendor `modules` work or how to get to them of reference them and how to install their dependencies
- The structure of an agent was also strange to understand is it was not clear which scripts was vendor scripts or modules and what was done for `Pulse`
- So to parse an Expect script and to do it in a way that fits with the rest of the system I first had to figure out how the system works and where all the dependencies are


## 1. Location

> The Fortinet FortiWeb SSH Agent is now located:

```shell
cd /opt/pulse/server/agents/server-side/system/ssh/fortinet/fortinetFortiwebPlatfrom/expect/ 
```

## 1. Structure

The Fortinet FortiWeb Agent is derived from the Fortinet FortiGate Firewall, and I used the Firewall's agent as a starting point for this agent.
> The firewall's files spread all over the server and there were references to libraries and dependencies that I could not locate on the server.

- I did some research and I found all the referenced libraries with their dependencies and figured out how to install the libraries on my development environment. This is important so so that the error checking, code completion and warnings function the way it should.
- Except for the vendor libraries there are a few local custom scripts referenced:
  - MODULE: use PulseOutput
  - SCRIPT: require "/usr/local/mss/server/agents/server-side/system/ssh/fortinet/fortigateFirewallPlatform/expect/datablock/lib_parse.pl";
  - SCRIPT: require "/usr/local/mss/server/agents/server-side/system/ssh/fortinet/fortigateFirewallPlatform/expect/infoblock/lib_parse.pl";
  - SCRIPT:require "/usr/local/mss/server/agents/server-side/system/ssh/fortinet/fortigateFirewallPlatform/expect/backup/lib_parse.pl";

## 3. Perl Syntax

> *The `use` statement refers to a perl module. The modules can be identified in the `file system` by it's `.pm (Perl Module)` file extension*.

By default all `perl` modules are located in `/usr/bin/perl`.
> If a folder is referenced then all the `.pm` files in that folder will be accessible but not yet included for compilation.

In the referenced folder below:  `/usr/local/mss/server/lib` the following files exists:

> - Logging.php
> - printing_functions.pl
> - PulseOutput.pm
> - snmp_process_functions.pl

In the `automation.pl`:

```perl
# Tells perl to change the modules folder to '/usr/local/mss/server/lib' and the references the 'PulseOutput' module
use lib '/usr/local/mss/server/lib';
use PulseOutput qw(:All);
```

- There is also a `qw` directive. The `qw` directive specifies which part of the module to `use`. In the code above the `:all` directive means that perl must import the entire module into the script.

The `.pl` files are normal `perl` scripts that would be accessible with the `require` directive. So `modules` are referenced by by `use` and `scripts` are referenced` by `require`
> **IMPORTANT:** `Absolute paths` must be used for `.pl` scripts to `require` them

## 4. Perl Sub-Routines Modules and Packages

The advantage of using modules are that each module has a `package` statement right at the top. This gives all the `sub-routines` (Perl's word for a `function`) a `namespace` (`Scope`) that it runs in, so two `functions` (`sub-routines`) with the same name won't overwrite each other

## 5. Perl Sub-Routine

```perl
#!/usr/bin/perl

# Function definition
sub Hello {
   print "Hello, World!\n";
}

# Function call
Hello();
```

## 6. Perl Package (Module)

**Perl Module: `Say.pm`**

```perl
#!/usr/bin/perl
package Say;

# Function definition
sub Hello {
   print "Hello, World!\n";
}

# Function call
Hello();
```

## 7. Referencing a module and sub-routine

**Perl Script: `hello.pl`**

```perl
#!/usr/bin/perl
use Say;

# Call sub-routine in Module
Say::hello();
```

## 8. Now that I know all of this

- I googled and found that `IntelliJ Idea` supports Perl development. The same company also created Android Studio and PHP Storm which are both excellent IDE's so I installed it.
- I mounted my `Samba` share (`\\192.168.9.23\charl`) as a network drive `P:`
- In `IntelliJ Idea` I Added `P:\code\server\agents\` as the root of my `Perl` Project

## 9. Updates

I changed all the scripts referenced like this:

```perl
require "/usr/local/mss/server/agents/server-side/system/ssh/fortinet/fortigateFirewallPlatform/expect/datablock/lib_parse.pl";
```

I changed them to be `modules` and now reference them like this:

```perl
use backupBlock::parseBackup;
use dataBlock::parseData;
use infoBlock::parseInfo;
```

`backupBlock`,`dataBlock`,`infoBlock` are all folders located in the `expect` folder that is located in the `fortinetFortiWebPlatform` folder:

```shell
┤fortinetFortiWebPlatform
└─┤ expect
  ├─┤ backupBlock
  │ └─ parseInfo.pm
  ├─┤ dataBlock
  │ └─ parseData.pm
  ├─┤ infoBlock
  │ └─ parseInfo.pm
```

I did this so that I don't have to use the `Absolute Path` to `require` them because they are located outside of my `Samba` so my IDE can't locate them for build purposes or code completion or code analysis.

If you module has name package `backupBlock::parseBackup`; or maybe even `blocks::backup::Parser` then is means the modules location is:

```shell
./backupBlock/parseBackup.pm

# Or

./blocks/backup/Parser.pm
```

The sign `::` is the same as `/` for directory path in which the module will be found. Any `.pm` module file in the `./` directory will be found of course if you use make right name for it.

## 10. Finally

The `scripts` above used to be referenced by calling some of the sub-routines:

```perl
#!/usr/bin/perl
require "/usr/local/mss/server/agents/server-side/system/ssh/fortinet/fortigateFirewallPlatform/expect/datablock/lib_parse.pl";

# Some code

%system_datablocks=datablock_parse($output);
```

If any one of those scripts had a sub-routine with the same name it would have stopped working

Those sub-routines can now be accessed like this:

```perl
#!/usr/bin/perl
use dataBlock::parseData;

# Some code

%systemDataBlocks = parseData::Parse($output);
```

`dataBlock` references a folder that contains a `.pm` file called `parseData.pm`

Each one of the `modules` have the same sub-routine called `Parse`

## 11. Creating a new Agent

In the future to create a new `Expect` script

- Navigate to `/opt/pulse/server/agents/server-side/system/ssh/fortinet/`;

Copy the `TemplatePlatform` folder to `[NewPlatform]` folder.

```shell
cp -R ./TemplatePlatform /opt/pulse/server/agents/server-side/system/ssh/fortinet/[newPlatform]
```

> Things to note in the `automation.pl` script

1. Near the top, marked as: `# PULSE INCLUDES`
1. The `PulseOutput::setOutputLevel($outputLevel);` is the indentation if the output `xml`
1. `output(1,"Script start")` refers to 1 = level above `our $outputLevel = 3;` and 2nd argument "Text to output"
1. Look at DB Query at `# Get list of systems`
   1. Update the following ID's to match your agent:
      1. `monitor_agent_id`
      1. `monitor_operatingSystem_id`
      1. `monitor_platform_id`
1. Look at DB Query at `# Region DB Connection`
   1. Update the following ID's to match your agent:
      1. `monitor_agent_id`
      2. `monitor_operatingSystem_id`
      3. `monitor_platform_id`

## 13. Existing sub-routines for data parsing

`snmp_process_functions.pl` file

- functionPlain()
- functionPlainComplex()
- functionRunningProcesses()
- functionUptime()
- functionInterfaceStatus()
- functionInterfaceDiff
- functionSwitch
- functionEqualTo
- functionSwap
- functionNotEqualTo
- functionInterfaceErrors
- functionPolicyInstall
- functionHashMemory
- functionFirewallMemory
- functionCheckpointCPU
- functionCheckpointDisk
- functionCheckpointIPSEC
- functionCheckpointVPNUsers
- functionCheckpointVPNSites
- functionDroppedPackets
- getData
- getTable
- functionHrStorageDisk
- functionHrStorageRam
- functionHrStorageSwap
- functionHrSwRun
- functionTcpNetstat
- functionHrProcessorLoadPerCore
- functionHrProcessorLoad
- writeToLog
