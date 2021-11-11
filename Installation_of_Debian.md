###### Debian installation
  ## My steps to create a [Debian](https://www.debian.org/) based server using [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
# 1. Install and Run VirtualBox
# <a id="step2" /> 2. Download the latest stabel version of Debian
# 3. Click to "New" button to manage pre-installation settings
  ![NEW](https://user-images.githubusercontent.com/61047851/141314856-0c0445ab-cebf-4d98-86ec-494afe690300.png)
  - Name:           choose the name
  - Machine Folder: for school_42 environment it should be "goinfre" directory
  - Type:           choose the type of OS you would install
  - Version:        choose the name and version of OS you installing
  - Memory size:    choose size of RAM memory for your OS
# 4. Click to "Create" bellow to continue presetting
  ![size_of_hard_memory](https://user-images.githubusercontent.com/61047851/141316918-f9247e0e-5c01-497b-bb36-24bad851e773.png)
  - File size:      choose size of hard memory you need for your project, and click "Create"
# 5. Choose youe project in VirtualBox and click to "Settings" for last presetting.
  ![last_presettings](https://user-images.githubusercontent.com/61047851/141317675-5dac1b31-92c7-42fd-93d8-8a1fb82317c6.png)
  - System tab:
     - Boot Order:
      - unmark Floppy
      - mark Network
  - Display tab: 
    - Scale factor: choose percentage useful for you and click "OK"
# 6. Click "Start" and choose the direction to file from [step 2](#step2), click "Start"
  ![image](https://user-images.githubusercontent.com/61047851/141319208-b5c574da-5994-489c-ad97-56e9ae5c7d06.png)
# 7. We not allowed to use "Graphical installetion" interface. So choose "Ibstall" and press "enter" key
![image](https://user-images.githubusercontent.com/61047851/141326333-e9fdf087-582c-4727-ab77-be35036e8a41.png)
# 8. Choose the language would you like to have on your server and press "enter" key
# 9. Choose your location and press "enter" key
# 10. Choose keymap and press "enter" key
# 11. Choose "hostname" by subject it must be in that format username42, press "enter" key
# 12. By subject we not need any "Domain names", so just press "enter" key
# 13. Choose "root password", but for now u may use simple one, and later change it when you will setting up password policy, press "enter" key, repeat that step
# 14. Full name for the new user is not really important, you may type anything you want, but dont forget it, press "enter" key
# 15. Repeat step 13 for new user
# 16. Select your time zone
# 17. Than we have to partitioning our disk, following the subject
  ![image](https://user-images.githubusercontent.com/61047851/141333371-a9c273d4-284b-4b6e-bfa0-03e775b8dd9f.png)
