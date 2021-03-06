APT_OUTPUT='@@@@@1@@@@@'

apt-get update &>> "${LOG}" &&
GIT_AUTHOR_NAME='root' GIT_AUTHOR_EMAIL="root@$(hostname)" GIT_COMMITTER_NAME='root' GIT_COMMITTER_EMAIL="root@$(hostname)" DEBIAN_FRONTEND='noninteractive' apt-get -y upgrade 2>&1 | tee "${APT_OUTPUT}" >> "${LOG}" &&

UPDATED="$(grep -o '[0-9]\+ upgraded' "${APT_OUTPUT}" | grep -o '[0-9]\+')" &&
NOT_UPDATED="$(grep -o '[0-9]\+ not upgraded' "${APT_OUTPUT}" | grep -o '[0-9]\+')"

if [ -z "${UPDATED}" ]; then
    UPDATED='0'
fi

if [ -z "${NOT_UPDATED}" ]; then
    NOT_UPDATED=0
fi

if [ "${UPDATED}" -gt '1' ]; then
    UPDATED_PLURAL='s'
else
    UPDATED_PLURAL=''
fi

if [ "${NOT_UPDATED}" -gt '1' ]; then
    NOT_UPDATED_PLURAL='s'
else
    NOT_UPDATED_PLURAL=''
fi


SUBJECT=''

if [ "${UPDATED}" -gt '0' ] && [ "${NOT_UPDATED}" -gt '0' ]; then
    SUBJECT="Installed ${UPDATED} update${UPDATED_PLURAL}; ${NOT_UPDATED} package${NOT_UPDATED_PLURAL} not updated"
elif [ "${UPDATED}" -gt '0' ]; then
    SUBJECT="Installed ${UPDATED} update${UPDATED_PLURAL}"
elif [ "${NOT_UPDATED}" -gt '0' ]; then
    SUBJECT="${NOT_UPDATED} package${NOT_UPDATED_PLURAL} not updated"
fi

if [ ! -z "${SUBJECT}" ]; then
    "${EMAIL_SCRIPT}" "${SUBJECT}" "$(cat "${APT_OUTPUT}")"
fi


unset APT_OUTPUT UPDATED NOT_UPDATED UPDATED_PLURAL NOT_UPDATED_PLURAL SUBJECT
