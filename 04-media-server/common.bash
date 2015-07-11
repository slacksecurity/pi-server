# Common stuff; should be sourced, not run!

source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../01-core/common.bash"

export PI_SERVER_MINIDLNA_MEDIA="${PI_SERVER_DATA_DIR}/media-server"
export PI_SERVER_MINIDLNA_PODCASTS="${PI_SERVER_MINIDLNA_MEDIA}/Podcasts - New"
export PI_SERVER_MINIDLNA_PODCASTS_LISTENED="${PI_SERVER_MINIDLNA_MEDIA}/Podcasts - Listened"

export PI_SERVER_MASHPODDER_CONFIG_REPO="${PI_SERVER_DATA_MAIN_DIR}/podcasts-config-$(hostname)"
export PI_SERVER_MASHPODDER_RSS_FILE="${PI_SERVER_MASHPODDER_CONFIG_REPO}/configuration.txt"

export PI_SERVER_MASHPODDER_SCRIPT_DIR="${PI_SERVER_DIR}/mashpodder"
export PI_SERVER_MASHPODDER_SCRIPT="${PI_SERVER_MASHPODDER_SCRIPT_DIR}/mashpodder.sh"
export PI_SERVER_MINIDLNA_CONFIG="${PI_SERVER_DATA_CONFIG_DIR}/minidlna"
export PI_SERVER_MINIDLNA_DB="${PI_SERVER_MINIDLNA_CONFIG}/db"
export PI_SERVER_MASHPODDER_ROOT="${PI_SERVER_MINIDLNA_CONFIG}/mashpodder"
export PI_SERVER_MASHPODDER_TMP_DIR="${PI_SERVER_MASHPODDER_ROOT}/tmp"

export PI_SERVER_PODCAST_MANAGER_SCRIPT="${PI_SERVER_DIR}/podcast-manager"
