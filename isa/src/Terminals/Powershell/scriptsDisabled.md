# Running Scripts Is Disabled on This System

This error often occurs when the PowerShell execution policy doesn’t allow sunning scripts. In addition, this error also appears when running a certain PowerShell script. To fix the “execution of scripts is disabled on this system” error, we explore the following troubleshooting methods.

## Fix 1. Set the PowerShell `Execution Policy` to RemoteSigned

As you might know, the `PowerShell` `execution policy` is set to `Restricted` status by default. In order to run the `PowerShell` script, you need to create a `PowerShell` script first and then change the `execution policy`.

There are 4 major different `execution policies` and you can change it based on your demands.

- `Restricted`: You cannot run the `PowerShell` script. That’s why you encounter the `PowerShell` running scripts is disabled on this system issue.
- `AllSigned`: You can run only the `PowerShell` scripts that are signed by a trusted publisher.
- `RemoteSigned`: You can run the downloaded scripts signed by a trusted publisher.
- `Unrestricted`: You can run all Windows `PowerShell` scripts.

So, changing the execution `policy` can help you fix the error __running scripts is disabled on this system__. The first choice is to change the execution `policy` to RemoteSigned. Here’s how to do that:

*Step 1*. Right-click the `Start` menu and select the `Windows PowerShell (Admin)` option from the context menu.
*Step 2*. In the pop-up window, type the following command to get the list of Execution policies on your Windows 10 PC.

```powershell
Get-ExecutionPolicy – List
```

*Step 3*. If you find the Execution Policy is set to either `Undefined` or `Restricted` status, you can type the following command and hit `Enter` t change it.

```powershell
Set-ExecutionPolicy RemoteSigned
```

*Step 4*. You will be asked for various permissions. Hit the `Y` key to say `Yes` to all the message individually, or hit the `A` key to say `Yes` to all messages at once.

Now, restart your computer and run `Windows PowerShell` script to see if the issue “running scripts is disabled on this system” is resolved.

Now, restart your computer and run `Windows PowerShell` script to see if the issue “running scripts is disabled on this system” is resolved.

## Fix 2. Set the `PowerShell Execution Policy` to Unrestricted

In addition to the above method, you can try changing the Execution Policy to Unrestricted to fix the error “cannot be loaded because running scripts is disabled on this system”. To do so, follow the steps below:

*Step 1*. Open the `Windows PowerShell` as an administrator by the above method.

*Step 2*. Then type the command `Set-ExecutionPolicy Unrestricted` and hit Enter.

*Step 3*. Now, you can hit the `Y` key or the `A` key to change the Execution Policy.

After that, the "execution of scripts is disabled on this system" problem should be fixed. If this command line triggers an error, you can run the command `Set-ExecutionPolicy Unrestricted –Force`. This command will force changing the Execution Policy.
