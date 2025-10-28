!/bin/bash

james-cli AddUser alice@localhost aliceSecret
james-cli AddUser bob@localhost bobSecret
james-cli AddUser empty@localhost emptrySecret

declare -a arr=("INBOX" "Important" "tmail" "tmail.mobile" "tmail.backend" "tmail.backend.extensions" "tmail.backend.extensions.pgp" "tmail.backend.extensions.filters" "tmail.backend.extensions.ticketAuth" "tmail.backend.memory" "tmail.backend.distributed" "tmail.marketting" "admin" "customers" "james" "james.dev" "james.user" "james.pmc" "james.dev.gsoc" "Outbox" "Sent" "Drafts" "Trash" "Spam" "loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong" "a.b.c.d.e.f.g.h.i.j")

for i in "${arr[@]}"
do
   echo "Creating mailbox $i"
   james-cli CreateMailbox \#private alice@localhost $i &
   james-cli CreateMailbox \#private bob@localhost $i &
   wait
done

echo "Provisioning completed."