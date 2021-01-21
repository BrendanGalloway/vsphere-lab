# IBM Lab connection and setup

[Download and install MotionPro VPN ](https://cloud.ibm.com/docs/iaas-vpn?topic=iaas-vpn-standalone-vpn-clients#linux-standalone-client)

## Complete IBM cloud account creation

Click Manage > Access (IAM), and select Users.
Scroll down to VPN password, note username and set VPN password

*Note the the IBM cloud login details and the VPN login details are different*

Configure MotionPro with username and password as per IAM setup, endpoint https://vpn.ams03.softlayer.com

Someone with rights must click 'enable SSL VPN access' for you once registered

## Check VCenter/NSX Logins

URLS and login details are in passsword store under vcs4m-vc and vcs4m-nsx

## Load env vars

Setup [AWS credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html) for vsphere account (details in password store, search for AWS KMS Key)

Install [sops](https://github.com/mozilla/sops/releases) 

## Connect to jump host

Use the ibm_shuttle.sh script to connect to the jump host.  This will pull the jump host details from the encrypted env file with sops. Once connected, karina and kubectl can be used to access the clusters running in the lab
