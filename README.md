standard-users
===

Support for creating users with standaradized uid/gid

Design
---

The users.txt file contains a list of unix usernames and IDs.
The associated script files creates users with that ID and matching groups.
If the user or group is already created with the correct id, it does nothing.
Otherwise, if there are any conflicts or issues, the scripts error out.

Usage
---

On any modern unix, run `main.sh`.
Alternatively pull users.txt and use it however you need.

Known Consumers
---

- [base-image-general](https://github.com/AnchorFree/base-image-general)
- [ansible-roles-common](https://github.com/AnchorFree/ansible-roles-common/)

