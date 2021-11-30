### Creat a strong password policy        

We must apply a strong password policy for all users, root included, that must be set to this:
> 1. Your password has to expire every 30 days.
> 2. The minimum number of days allowed before the modification of a password will be set to 2.
> 3. The user has to receive a warning message 7 days before their password expires.
> 4. Your password must be at least 10 characters long. 
> 5. It must contain an uppercase letter and a number. Also, it must not contain more than 3 consecutive identical characters.
> 6. The password must not include the name of the user.
> 7. The following rule does not apply to the root password **by default**: The password must have at least 7 characters that are not part of the former password.

The first 3 rules must be set by editing `/etc/login.defs`. The final result should look like this:
![image](https://user-images.githubusercontent.com/61047851/144067856-85c2c58f-5d7b-492b-884b-1a975d5565bd.png)           
           
For the users already created (root included) these optons will not be automatically enabled. You will have to enforce them by using the `chage` command and manually apply the rules above. You can use the flag `-l` to list the rules applied to a specific user.
```
# chage -M 30 <username/root>
# chage -m 2 <username/root>
# chage -W 7 <username/root>
# chage -l <username/root>
```

The last 3 rules can be applied by using a package called `pam-pwquality`. To download it use: 
```
# aptitude install libpam-pwquality
```
To apply these rules, you shoud edit `/etc/pam.d/common-password` by uncommenting and changing the following lines: 

```
password requisite pam_pwquality.so minlen=10 ucredit=-1 lcredit=-1 \
dcredit=-1 maxrepeat=3 retry=3 usercheck=1 enforce_for_root // правила для root

password requisite pam_pwquality.so minlen=10 ucredit=-1 lcredit=-1 \
dcredit=-1 maxrepeat=3 retry=3 usercheck=1 difok=7 // правила для остальных пользователей
```

Then you will need to set new passwords for the users already created (root included), following the new password policy:
```
# passwd <username>
```
