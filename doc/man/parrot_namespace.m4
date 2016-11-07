include(manual.h)dnl
HEADER(parrot_namespace)

SECTION(NAME)
BOLD(parrot_namespace) - run a command in a modified namespace.

SECTION(SYNOPSIS)
CODE(BOLD(parrot_cp [options] PARAM(command)))

SECTION(DESCRIPTION)

CODE(parrot_namespace) detects whether it is already running under Parrot
and either forks a new mount namespace in the existing Parrot session or
simply executes CODE(parrot_run). For applications that only need to make
mount-related changes, CODE(parrot_namespace) is a drop-in replacement
for CODE(parrot_run) that automatically handles nested invocations.

SECTION(OPTIONS)

OPTIONS_BEGIN
OPTION_ITEM(`-M, --mount /foo=/bar')Mount (redirect) CODE(/foo)
to CODE(/bar) (CODE(PARROT_MOUNT_STRING))
OPTION_ITEM(`-m, --ftab-file <path>')Use CODE(<file>) as a
mountlist (CODE(PARROT_MOUNT_FILE))
OPTION_ITEM(`--parrot-path')Path to CODE(parrot_run) (CODE(PARROT_PATH))
OPTION_ITEM(`-d, --debug <flags>')Enable debugging for this
subsystem (CODE(PARROT_DEBUG_FLAGS))
OPTION_ITEM(`-v, --version')Show version number
OPTION_ITEM(`-h, --help')Help: Show these options
OPTIONS_END

SECTION(EXIT STATUS)
On success, returns zero.  On failure, returns non-zero.

SECTION(EXAMPLES)

To run Parrot under Parrot with a modified mount environment,
use CODE(parrot_namespace)

LONGCODE_BEGIN
% parrot_namespace -M /tmp=/tmp/job01 sh
% parrot_mount --unmount /tmp    # not allowed
LONGCODE_END

Now in the same shell, we can call CODE(parrot_namespace) regardless
of whether we're already running under Parrot or not.

LONGCODE_BEGIN
% parrot_namespace -m mountfile foo
LONGCODE_END


SECTION(COPYRIGHT)

COPYRIGHT_BOILERPLATE

SECTION(SEE ALSO)

SEE_ALSO_PARROT

FOOTER
