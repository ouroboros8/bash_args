function err {
  >&2 echo $@
}

function usage {
  err "Usage: $0 hello|bye [OPTIONS]"
  exit 1
}

function hello {
  function usage {
    err "Usage $0 hello [--formal] [--lower-case] [--upper-case]"
    exit 1
  }
  message="Hello."
  while [ $# -ge 1 ]; do
    case $1 in
      --formal)
        message="Greetings, good sir!"
        ;;
      --lower-case)
        message="hello."
        ;;
      --upper-case)
        message="HELLO."
        ;;
      *)
        usage
    esac
    shift
  done

  echo $message
}

function bye {
  function usage {
    echo "Usage $0 goodbye [--formal] [--lower-case] [--upper-case]"
    exit 1
  }
  $message="Bye."
  while [ $# -ge 1 ]; do
    case $1 in
      --formal)
        message="Fare thee well, good sir!"
        ;;
      --lower-case)
        message="bye."
        ;;
      --upper-case)
        message="BYE."
        ;;
    esac
    shift
  done
  echo $message
}

case $1 in
  hello)
    shift
    hello $@
    ;;
  bye)
    shift
    bye $@
    ;;
  *)
    usage
    ;;
esac
