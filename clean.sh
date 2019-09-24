rm -r ./build/
rm -r ./bin/
rm Makefile

#makeheaders $(find ./src/ -name "*.[c]")
rm ./src/**.h

for file in $(find ./src/ -name "*.[c]")
do
  makeheaders $file
done

for file in $(find ./src/ -name "*.[h]")
do
  header_id=$(echo $file | tr ./ _)
  header_id=$(echo ${header_id^^} | cut -c 3- )

  sed -i "1a #ifndef ${header_id}\n#define ${header_id}" $file
  sed -i "\$a #endif" $file
  #echo $header_id
done
