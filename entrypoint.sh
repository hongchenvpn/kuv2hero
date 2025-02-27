#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
���}bentrypoint.sh uS�n�0��+��-PZmѤ@��4�<�͡JZŬ)2 ��]C�^�WNk�����r9�y���$~���k�Js�L5zv2?__���y��%�ON.y���_MF�����&-<��9䃷匰|����S����X.!��P��IRְL���|������):;�_>jV�ǕIm0������:��`us=�T�{��d3�#��%z�{�G"ek��^�i��^UY�*����Iճ[�R�Q��s5��~���ӓCY�nm� =[7��>�WE#�uc;IӶ�ۛ��E�7[b�����6����j�s[�n'�X��&HH�e��@u���F�e�i�!�%|���\R%�^�.��l���rV"�����Q�4��̖1��^���u�t�|�%��$��F[�w�LX�����*F��c�r�&Y�2���n�Ŝ��z��9:��L,֕1��/g�r ^���V��R�nז�~:���U�Һ���$�no���O��ew��3u@��+�J�xu�q0�ۦ��m��m=��P�u  