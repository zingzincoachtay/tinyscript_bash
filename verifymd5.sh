
export this=$(md5deep $1 | cut -d ' ' -f1)
if this==$2 ; then
  echo Match
else
  echo No Match
fi

