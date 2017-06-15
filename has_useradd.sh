#!/bin/sh

# TODO: If given arguments, create each user passed as an argument.
# Otherwise, create all standard users and groups.

#    groupadd -g $USER_GID -r $GROUP_NAME
#    useradd -M -s /bin/false -u $USER_UID -g $USER_GID $USER_NAME

while read name uid; do

    # Check if group already exists
    group_line=$(grep ^$name\\: /etc/group)
    if [ $? -ne 0 ]; then
        echo "adding group $name : $uid"
        groupadd --gid $uid $name || exit 1
    elif [ "$uid" != $( echo "$group_line" | awk -F: '{print $3}' ) ]; then
        echo "Group $name already exists but has wrong gid"
        exit 1
    else
        echo "Group $name already exists with correct gid $uid"
    fi

    # Check if user already exists
    passwd_line=$(grep ^$name\\: /etc/passwd)
    if [ $? -ne 0 ]; then
        echo "adding user $name : $uid"
        useradd --no-create-home --shell /bin/false --gid $uid -u $uid $name || exit 1
    elif [ "$uid" != $( echo "$passwd_line" | awk -F: '{print $3}' ) ]; then
        echo "User $name already exists but has wrong uid"
        exit 1
    else
        echo "User $name already exists with correct uid $uid"
    fi

done < "$(dirname "$0")/users.txt"
