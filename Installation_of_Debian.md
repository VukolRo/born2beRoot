# Debian installation
  ### My steps to create a [Debian](https://www.debian.org/) based server using [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
1. Install and Run VirtualBox
<a id="step2" /> 2. Download the latest stabel version of Debian
3. Click to "New" button to manage pre-installation settings
  ![NEW](https://user-images.githubusercontent.com/61047851/141314856-0c0445ab-cebf-4d98-86ec-494afe690300.png)
  - Name:           choose the name
  - Machine Folder: for school_42 environment it should be "goinfre" directory
  - Type:           choose the type of OS you would install
  - Version:        choose the name and version of OS you installing
  - Memory size:    choose size of RAM memory for your OS
4. Click to "Create" bellow to continue presetting
  ![size_of_hard_memory](https://user-images.githubusercontent.com/61047851/141316918-f9247e0e-5c01-497b-bb36-24bad851e773.png)
  - File size:      choose size of hard memory you need for your project, and click "Create"
5. Choose youe project in VirtualBox and click to "Settings" for last presetting.
  ![last_presettings](https://user-images.githubusercontent.com/61047851/141317675-5dac1b31-92c7-42fd-93d8-8a1fb82317c6.png)
  - System tab:
     - Boot Order:
      - unmark Floppy
      - mark Network
  - Display tab: 
    - Scale factor: choose percentage useful for you and click "OK"
6. Click "Start" and choose the direction to file from [step 2](#step2), click "Start"
  ![image](https://user-images.githubusercontent.com/61047851/141319208-b5c574da-5994-489c-ad97-56e9ae5c7d06.png)
7. We not allowed to use "Graphical installetion" interface. So choose "Ibstall" and press "enter" key
![image](https://user-images.githubusercontent.com/61047851/141326333-e9fdf087-582c-4727-ab77-be35036e8a41.png)
8. First part of installation (press "enter" key to submit your choosing in every step further)
  - Choose the language would you like to have on your server
  - Choose your location
  - Choose keymap
  - Choose "hostname" by subject it must be in that format username42
  - By subject we not need any "Domain names"
  - Choose "root password", but for now u may use simple one, and later change it when you will setting up password policy, repeat that step
  - Full name for the new user is not really important, you may type anything you want, but dont forget it
  - Repeat step 13 for new user
  - Select your time zone
9. Than we have to partitioning our disk, following the subject (press "enter" key to submit your choosing in every step further)
    ![image](https://user-images.githubusercontent.com/61047851/141333371-a9c273d4-284b-4b6e-bfa0-03e775b8dd9f.png)
  - Choose manul
  - Choose (sda) to partitioning 
   ![image](https://user-images.githubusercontent.com/61047851/141334449-d8dcf1a3-f523-4cc8-a01a-d3acf46860ce.png)
  - Choose Yes to creat new empty partition table on this device
   ![image](https://user-images.githubusercontent.com/61047851/141334885-b646007a-d62b-4d96-9665-1687154446b3.png)
  - Choose "free space" to partitioning
    ![image](https://user-images.githubusercontent.com/61047851/141335214-7e8fb1db-12fd-4ded-86bc-1c6a5d2eb284.png)
  - First we need to creat **"sda1"** part and give it /boot mount point
    - choose "Create a new partition"
      ![image](https://user-images.githubusercontent.com/61047851/141335355-b5360c04-2c6a-45e9-a0dd-3ab2be711fc9.png)
    - type "525 M" as required in subject for sda1
      ![image](https://user-images.githubusercontent.com/61047851/141675705-18af1a49-1c29-4ceb-b149-57b175ac3274.png)
    - choose "primary" type for that partition
      ![image](https://user-images.githubusercontent.com/61047851/141335721-3d29c902-4bb4-4c7f-8fc9-81145f6c42de.png)
    - choose "beginning" for that part
      ![image](https://user-images.githubusercontent.com/61047851/141335927-0703bd3d-fdc5-4e84-a36a-97720af3be88.png)
    - choose "Mount point"
      ![image](https://user-images.githubusercontent.com/61047851/141336150-78245909-bd5f-4a11-a445-ad1fb54c2512.png)
    - choose "/boot" as mount point
      ![image](https://user-images.githubusercontent.com/61047851/141336240-ec9bb949-5f72-40ca-8004-7d55a5009af6.png)
    - choose "done setting..."
      ![image](https://user-images.githubusercontent.com/61047851/141336627-0031c45d-60c2-4f61-a37c-1d7db5011358.png)
  - Second we need to create **"sda5"** part, which is have to be logical and encrypted and partitioning to other seven part
    - first of all we will create that part and crypted it, choose "free space" to partitioning
      ![image](https://user-images.githubusercontent.com/61047851/141339680-22381fd5-154a-4822-8da0-542420af724c.png)
    - choose "Create a new partition"
    - choose maximum size for this partition
    - choose "logical" type for that partition
    - choose "use as"
    - choose "physical volume for LVM" as required in subject for that partition
      ![image](https://user-images.githubusercontent.com/61047851/141340495-fe47ca4e-5e46-433a-8b3b-9521a4ea3448.png)
    - choose "done setting up the partition"
    - choose "configure encrypted volumes"
      ![image](https://user-images.githubusercontent.com/61047851/141340853-9b0a82f3-ec1e-4c04-b797-aedcf63788c4.png)
    - choose "Yes" for "Write the changes..."
      ![image](https://user-images.githubusercontent.com/61047851/141340948-7c6336c8-aacf-414e-aa90-7edd217ce01f.png)
    - choose "Create encrypted volumes"
      ![image](https://user-images.githubusercontent.com/61047851/141341609-c4316b48-c84b-44a1-9e4e-4173160fb923.png)
    - choose "/dev/sda5, press "space" key to mark that partition, than press "enter" key
      ![image](https://user-images.githubusercontent.com/61047851/141341872-7000bede-363c-4093-8c19-4f54972e660b.png)
    - choose "done setting up the partition"
    - choose "Yes" for "Write the changes..."
    - choose "Finish"
      ![image](https://user-images.githubusercontent.com/61047851/141343772-f144641c-03e8-49f3-a27e-f2d382293e36.png)
    - choose "Yes" for "Really erase the data ..., partition #5 (sda)"
      ![image](https://user-images.githubusercontent.com/61047851/141344005-b3fd4d74-252d-4c67-9d72-90a725995e47.png)
    - type encrypted passphrase, it might be simpl like a passwords
      ![image](https://user-images.githubusercontent.com/61047851/141346036-a0db7862-345c-4379-b530-a6ba67ad7160.png)
   - Partitioning a sda5 to seven part, choose Configure the Logical Volume Manager (LVM)
    ![image](https://user-images.githubusercontent.com/61047851/141346901-27030bc5-585f-43b9-95d5-5bf6d1a8862c.png)
    - choose "Yes" for "Write the changes to disk and configure LVM
      ![image](https://user-images.githubusercontent.com/61047851/141346704-cbc87038-e2ca-4a14-82b5-e6f9b8b5ccf0.png)
    - choose "Create volume group"
      ![image](https://user-images.githubusercontent.com/61047851/141347294-1a2b9f40-07ef-403b-8ca6-97607259b1b8.png)
    - type LVMGroup as required in subject as a name of LVM group
      ![image](https://user-images.githubusercontent.com/61047851/141347528-fb11bd71-fe79-4b17-910f-07b32a63629c.png)
    - choose sda5_crypted for that group
      ![image](https://user-images.githubusercontent.com/61047851/141347593-14a36e10-240f-45ae-b474-2f2b59764a86.png)
    - than for each partition of LVMGroup choose "create logical volume"
      ![image](https://user-images.githubusercontent.com/61047851/141351994-96763ed5-f7bc-4558-843c-feccca5cc337.png)
    - choose LVMGroup
    - than type one of seven partition name(root, swap, var, srv, tmp, var-log)         
    choose size based on that 1 GiB = 1073741824 B           
      root          - 10 737 418 200 B        
      home          - 5 368 709 120 B      
      swap          - 2 469 606 200 B       
      var, srv, tmp - 3 221 225 470 B     
      var-log       - 4 294 967 300 B (here, you might be limited by the remaining of memory, just choose what you have) 
    - repeat 4 previous steps for all partitions
    - choose "Display config details" to se how partitioning is going
      ![image](https://user-images.githubusercontent.com/61047851/141677885-1f56c2dc-5d7f-4593-a2ec-b00df2805b0d.png)
    - choose "finish" to submit partitioning
      ![image](https://user-images.githubusercontent.com/61047851/141353220-68417fcf-8c8f-4f8f-985e-50012bf0aac5.png)
    - than you should choose each 7 partitions and make next 3 steps
      ![image](https://user-images.githubusercontent.com/61047851/141353372-cef26563-9812-44a1-acf8-46a8cc75b1b2.png)
      - choose "Use as" for each(except "swap") choose "Ext4", for swap choose "swap area"
      - than for each choose "Mount point"(except "swap") according to subject, for "var/log" use "Enter manually" option
        ![image](https://user-images.githubusercontent.com/61047851/141354639-79a94d71-d0d3-4031-a34e-c7156adc9107.png)
      - than choose "Done setting up the partition"
    - choose "Finish partitioning and write changes to disk" when you finished preveous 4 steps and have that picture
      ![image](https://user-images.githubusercontent.com/61047851/141355133-55f3c623-0e9a-4e43-ae3e-c8ffca57f78b.png)
    - choose "Yes" for "write the changes to disk"
    - choose "No" for "Scan extra instalattion media"
      ![image](https://user-images.githubusercontent.com/61047851/141357509-18d66b43-890c-49c6-9a72-473250618820.png)
    - choose ur location for Debian mirror
    - choose deb.debian.org for Debian archive mirror
    - leave field blank for HTTP proxy info, just press "enter" key
    - choose "no" if u don't want to participate in the packege usage survey
      ![image](https://user-images.githubusercontent.com/61047851/141358355-39a738d9-ebc6-4ed0-b25b-5df5d3df7fc2.png)
    - deselect all options. We’ll install all we need later manually (To deselect, just hit SPACE key)
      ![image](https://user-images.githubusercontent.com/61047851/141678226-f8348d84-8d2e-4eae-be54-3b4d98743d1e.png)
    - choose "Yes" for "install GRUB"
      ![image](https://user-images.githubusercontent.com/61047851/141359554-b80eda39-8b88-4cf0-912d-817134976f34.png)
    - choose /dev/sda... for instalation
      ![image](https://user-images.githubusercontent.com/61047851/141359678-476ffde4-c51b-4b77-a81d-510ce2bd94d0.png)
    - choose continui to reboot
      ![image](https://user-images.githubusercontent.com/61047851/141360142-d5bdfaee-07b7-4460-8d5d-56ba811dcb4e.png)
10. After reboout 
  - choose one of 2 interface
  - type crypto passphrase
  - as login you may choose root or new user name wich you created while installing Debian
  - run comand lsblk to see the structure we created
    ![image](https://user-images.githubusercontent.com/61047851/141678326-851bad0a-a5ba-47f3-aa9e-f9e564bda03e.png)

## Finished!
