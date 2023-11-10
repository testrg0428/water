#!/bin/bash
#
# 2020/9/19, 9/20  by borchen
#
# https://fhy.wra.gov.tw/fhyv2/monitor/reservoir
#
# https://www.tpex.org.tw/web/stock/aftertrading/daily_trading_info/st43_print.php?l=zh-tw\&d=103/1\&stkno=1258&s=0
# https://finance.yahoo.com/quote/4966.TWO/history?period1=1568901260&period2=1600523660&interval=1d&filter=history&frequency=1d
#
# ./stock-day_status.sh 2020 09 17
#
# https://www.taiwanstat.com/waters/latest

date1=$(date '+%Y%m%d%H%M%S')
date2=$(date '+%Y%m%d')

path="./json/$date2"
if [ ! -d $path ]; then mkdir -p $path; fi

curl -s -k https://fhyv.wra.gov.tw/FhyWeb/v1/Api/Reservoir/Visual?$format=JSON > $path/water-now-$date2.json
sleep 1

# 北台灣
jq . $path/water-now-$date2.json | jq '.['0']' > $path/water-north-$date2.json
sleep 1

# 中台灣
jq . $path/water-now-$date2.json | jq '.['1']' > $path/water-mid-$date2.json
sleep 1

# 南台灣
jq . $path/water-now-$date2.json | jq '.['2']' > $path/water-south-$date2.json
sleep 1

#
# [
#     {
#         "寶山第二水庫": {
#             "baseAvailable": "3147.18",
#             "id": "reservoir4",
#             "updateAt": "2023-09-15(15時)",
#             "volumn": "3167.00",
#             "percentage": 100,
#             "daliyOverflow": "32.03",
#             "daliyInflow": "31.28",
#             "daliyNetflow": 0.75,
#             "name": "寶山第二水庫"
#         },
#         "日月潭水庫": {
#             "baseAvailable": "12949.09",
#             "id": "reservoir9",
#             "updateAt": "2023-09-15(7時)",
#             "volumn": "12118.92",
#             "percentage": 93.5,
#             "daliyOverflow": "248.83",
#             "daliyInflow": "130.12",
#             "daliyNetflow": 118.71000000000001,
#             "name": "日月潭水庫"
#         },
#         "南化水庫": {
#             "baseAvailable": "8949.00",
#             "id": "reservoir16",
#             "updateAt": "2023-09-15(7時)",
#             "volumn": "8919.33",
#             "percentage": 99.6,
#             "daliyOverflow": "139.90",
#             "daliyInflow": "89.50",
#             "daliyNetflow": 50.400000000000006,
#             "name": "南化水庫"
#         },
#         "翡翠水庫": {
#             "baseAvailable": "33550.50",
#             "id": "reservoir1",
#             "updateAt": "2023-09-15(14時)",
#             "volumn": "27159.12",
#             "percentage": 80.9,
#             "daliyOverflow": "294.70",
#             "daliyInflow": "157.30",
#             "daliyNetflow": 137.39999999999998,
#             "name": "翡翠水庫"
#         },
#         "湖山水庫": {
#             "name": "湖山水庫",
#             "id": "reservoir19",
#             "updateAt": "2023-09-15(14時)",
#             "volumn": "5066.60",
#             "percentage": 100,
#             "daliyOverflow": "42.84",
#             "daliyInflow": "43.20",
#             "daliyNetflow": -0.35999999999999943,
#             "baseAvailable": "5058.33"
#         },
#         "鯉魚潭水庫": {
#             "baseAvailable": "11555.87",
#             "id": "reservoir6",
#             "updateAt": "2023-09-15(14時)",
#             "volumn": "11582.14",
#             "percentage": 100,
#             "daliyOverflow": "312.78",
#             "daliyInflow": "308.36",
#             "daliyNetflow": 4.419999999999959,
#             "name": "鯉魚潭水庫"
#         },
#         "烏山頭水庫": {
#             "baseAvailable": "7920.85",
#             "id": "reservoir15",
#             "updateAt": "2023-09-15(7時)",
#             "volumn": "7398.00",
#             "percentage": 93.4,
#             "daliyOverflow": "177.00",
#             "daliyInflow": "147.00",
#             "daliyNetflow": 30,
#             "name": "烏山頭水庫"
#         },
#         "石門水庫": {
#             "baseAvailable": "20526.01",
#             "id": "reservoir2",
#             "updateAt": "2023-09-15(14時)",
#             "volumn": "20474.76",
#             "percentage": 99.7,
#             "daliyOverflow": "599.18",
#             "daliyInflow": "547.68",
#             "daliyNetflow": 51.5,
#             "name": "石門水庫"
#         },
#         "蘭潭水庫": {
#             "baseAvailable": "921.80",
#             "id": "reservoir21",
#             "updateAt": "2023-09-15(7時)",
#             "volumn": "926.59",
#             "percentage": 100,
#             "daliyOverflow": "10.87",
#             "daliyInflow": "10.87",
#             "daliyNetflow": 0,
#             "name": "蘭潭水庫"
#         },
#         "霧社水庫": {
#             "baseAvailable": "3682.50",
#             "id": "reservoir10",
#             "updateAt": "2023-09-15(7時)",
#             "volumn": "3236.18",
#             "percentage": 87.8,
#             "daliyOverflow": "376.00",
#             "daliyInflow": "392.27",
#             "daliyNetflow": -16.269999999999982,
#             "name": "霧社水庫"
#         },
#         "曾文水庫": {
#             "baseAvailable": "50685.26",
#             "id": "reservoir14",
#             "updateAt": "2023-09-15(15時)",
#             "volumn": "50761.00",
#             "percentage": 100,
#             "daliyOverflow": "306.00",
#             "daliyInflow": "495.00",
#             "daliyNetflow": -189,
#             "name": "曾文水庫"
#         },
#         "白河水庫": {
#             "baseAvailable": "1387.50",
#             "id": "reservoir13",
#             "updateAt": "2023-09-15(8時)",
#             "volumn": "1252.00",
#             "percentage": 90.2,
#             "daliyOverflow": "3.65",
#             "daliyInflow": "4.45",
#             "daliyNetflow": -0.8000000000000003,
#             "name": "白河水庫"
#         },
#         "新山水庫": {
#             "baseAvailable": "995.96",
#             "id": "reservoir0",
#             "updateAt": "2023-09-15(7時)",
#             "volumn": "971.61",
#             "percentage": 97.5,
#             "daliyOverflow": "0.00",
#             "daliyInflow": "1.54",
#             "daliyNetflow": -1.54,
#             "name": "新山水庫"
#         },
#         "仁義潭水庫": {
#             "baseAvailable": "2480.27",
#             "id": "reservoir12",
#             "updateAt": "2023-09-15(7時)",
#             "volumn": "2333.69",
#             "percentage": 94,
#             "daliyOverflow": "26.12",
#             "daliyInflow": "0.00",
#             "daliyNetflow": 26.12,
#             "name": "仁義潭水庫"
#         },
#         "寶山水庫": {
#             "baseAvailable": "500.83",
#             "id": "reservoir20",
#             "updateAt": "2023-09-15(7時)",
#             "volumn": "503.50",
#             "percentage": 100,
#             "daliyOverflow": "10.30",
#             "daliyInflow": "10.30",
#             "daliyNetflow": 0,
#             "name": "寶山水庫"
#         },
#         "永和山水庫": {
#             "baseAvailable": "2993.43",
#             "id": "reservoir3",
#             "updateAt": "2023-09-15(8時)",
#             "volumn": "2997.20",
#             "percentage": 100,
#             "daliyOverflow": "14.70",
#             "daliyInflow": "14.80",
#             "daliyNetflow": -0.10000000000000142,
#             "name": "永和山水庫"
#         },
#         "阿公店水庫": {
#             "baseAvailable": "1519.81",
#             "id": "reservoir17",
#             "updateAt": "2023-09-15(14時)",
#             "volumn": "1073.00",
#             "percentage": 70.6,
#             "daliyOverflow": "7.17",
#             "daliyInflow": "0.00",
#             "daliyNetflow": 7.17,
#             "name": "阿公店水庫"
#         },
#         "明德水庫": {
#             "baseAvailable": "1239.84",
#             "id": "reservoir5",
#             "updateAt": "2023-09-15(7時)",
#             "volumn": "1189.05",
#             "percentage": 95.9,
#             "daliyOverflow": "16.82",
#             "daliyInflow": "9.40",
#             "daliyNetflow": 7.42,
#             "name": "明德水庫"
#         },
#         "石岡壩": {
#             "baseAvailable": "141.73",
#             "id": "reservoir8",
#             "updateAt": "2023-09-15(14時)",
#             "volumn": "94.45",
#             "percentage": 66.6,
#             "daliyOverflow": "1,014.30",
#             "daliyInflow": "1,008.80",
#             "daliyNetflow": 5.5,
#             "name": "石岡壩"
#         },
#         "牡丹水庫": {
#             "baseAvailable": "2651.32",
#             "id": "reservoir18",
#             "updateAt": "2023-09-15(14時)",
#             "volumn": "2024.00",
#             "percentage": 76.3,
#             "daliyOverflow": "67.94",
#             "daliyInflow": "60.66",
#             "daliyNetflow": 7.280000000000001,
#             "name": "牡丹水庫"
#         },
#         "德基水庫": {
#             "baseAvailable": "18866.34",
#             "id": "reservoir7",
#             "updateAt": "2023-09-15(7時)",
#             "volumn": "18442.94",
#             "percentage": 97.7,
#             "daliyOverflow": "380.87",
#             "daliyInflow": "402.00",
#             "daliyNetflow": -21.129999999999995,
#             "name": "德基水庫"
#         }
#     }
# ]
#

