#!/bin/bash

echo "Отчет о логе веб-сервера" > report.txt
echo "========================" >> report.txt
echo -e "Общее количество запросов: \t$(awk 'END { print NR }' access.log)" >> report.txt
echo -e "Количество уникальных IP-адресов: \t$(awk '!U[$1]++ {count++} END {print count}' access.log)\n" >> report.txt
echo "Количество запросов по методам:" >> report.txt
echo "$(awk '{count[$6]++} END {for (request in count) print count[request], substr(request, 2)}' access.log)" >> report.txt
echo -e "\nСамый популярный URL:\t$(awk '{count[$7]++} END {for (val in count) if (count[val] > max) {max = count[val]; most_popular = val} print most_popular}' access.log)" >> report.txt
echo "Программа успешно завершена, результат сохранен в файл report.txt"
