#!/bin/bash
#
# 2020/9/19, 9/20  by borchen
#
# CASE1:
# https://fhy.wra.gov.tw/fhyv2/monitor/reservoir
#
# https://www.tpex.org.tw/web/stock/aftertrading/daily_trading_info/st43_print.php?l=zh-tw\&d=103/1\&stkno=1258&s=0
# https://finance.yahoo.com/quote/4966.TWO/history?period1=1568901260&period2=1600523660&interval=1d&filter=history&frequency=1d
#
# ./stock-day_status.sh 2020 09 17
#
# https://www.taiwanstat.com/waters/latest
#
# CASE2:
# https://fhyv.wra.gov.tw/FhyWeb/v1/Api/Reservoir/Visual?$format=JSON


date1=$(date '+%Y%m%d%H%M%S')
date2=$(date '+%Y%m%d')

path="./json/$date2"
if [ ! -d $path ]; then mkdir -p $path; fi

curl -s -k https://fhyv.wra.gov.tw/FhyWeb/v1/Api/Reservoir/Visual?$format=JSON > $path/water-now2-$date2.json
sleep 1

# 北台灣
jq . $path/water-now2-$date2.json | jq '.['0']' | tee $path/water-north2-$date2.json
sleep 1

# 中台灣
jq . $path/water-now2-$date2.json | jq '.['1']' | tee $path/water-mid2-$date2.json
sleep 1

# 南台灣
jq . $path/water-now2-$date2.json | jq '.['2']' | tee $path/water-south2-$date2.json
sleep 1

#本日累積降雨量： -- mm
#昨日累積降雨量： 0 mm
#有效蓄水量：EffectiveStorage 萬立方公尺
#有效庫容量：EffectiveCapacity 萬立方公尺
#
#pi@raspberrypi:~/src/github/water/json/20250226 $ jq . water-now2-20250226.json
#[
#  {
#    "AreaCode": "A01",
#    "AreaName": "北區",
#    "ReservoirRealTimeInfos": [
#      {
#        "StationNo": "10201",
#        "StationName": {
#          "zh_TW": "石門水庫"
#        },
#        "Time": "2025-02-25T22:00:00+00:00",
#        "EffectiveStorage": 17373.3984,
#         "PercentageOfStorage": 84.64093539900614,
#         "Status": 5,
#         "YesterdayAccumulatedRainfall": 0.1,
#         "EffectiveCapacity": 20526
#       },
#       {
#         "StationNo": "10204",
#         "StationName": {
#           "zh_TW": "新山水庫"
#         },
#         "Time": "2025-02-26T07:00:00+00:00",
#         "EffectiveStorage": 975.74,
#         "PercentageOfStorage": 97.96979798385476,
#         "Status": 5,
#         "YesterdayAccumulatedRainfall": 0,
#         "EffectiveCapacity": 995.96
#       },
#       {
#         "StationNo": "10205",
#         "StationName": {
#           "zh_TW": "翡翠水庫"
#         },
#         "Time": "2025-02-26T10:00:00+00:00",
#         "EffectiveStorage": 34313.999356891,
#         "PercentageOfStorage": 92.74655479515158,
#         "Status": 5,
#         "YesterdayAccumulatedRainfall": 0.2,
#         "EffectiveCapacity": 36997.6
#       },
#       {
#         "StationNo": "10405",
#         "StationName": {
#           "zh_TW": "寶山第二水庫"
#         },
#         "Time": "2025-02-26T10:00:00+00:00",
#         "EffectiveStorage": 2694.56,
#         "PercentageOfStorage": 79.63330190826045,
#         "Status": 5,
#         "YesterdayAccumulatedRainfall": 0,
#         "EffectiveCapacity": 3383.71
#       },
#       {
#         "StationNo": "10501",
#         "StationName": {
#           "zh_TW": "永和山水庫"
#         },
#         "Time": "2025-02-26T10:00:00+00:00",
#         "EffectiveStorage": 2271.549,
#         "PercentageOfStorage": 75.88448702658823,
#         "Status": 5,
#         "AccumulatedRainfall": 0,
#         "YesterdayAccumulatedRainfall": 0,
#         "EffectiveCapacity": 2993.43
#       },
#       {
#         "StationNo": "10601",
#         "StationName": {
#           "zh_TW": "明德水庫"
#         },
#         "Time": "2025-02-26T07:00:00+00:00",
#         "EffectiveStorage": 1071.68,
#         "PercentageOfStorage": 85.66518253251374,
#         "Status": 5,
#         "AccumulatedRainfall": 0,
#         "YesterdayAccumulatedRainfall": 0,
#         "EffectiveCapacity": 1251.01
#       }
#     ]
#   },
#   {
#     "AreaCode": "A02",
#     "AreaName": "中區",
#     "ReservoirRealTimeInfos": [
#       {
#         "StationNo": "20101",
#         "StationName": {
#           "zh_TW": "鯉魚潭水庫"
#         },
#         "Time": "2025-02-26T10:00:00+00:00",
#         "EffectiveStorage": 9096.83,
#         "PercentageOfStorage": 78.75675076663083,
#         "Status": 5,
#         "AccumulatedRainfall": 0,
#         "YesterdayAccumulatedRainfall": 0,
#         "EffectiveCapacity": 11550.54
#       },
#       {
#         "StationNo": "20201",
#         "StationName": {
#           "zh_TW": "德基水庫"
#         },
#         "Time": "2025-02-26T07:00:00+00:00",
#         "EffectiveStorage": 18007.26,
#         "PercentageOfStorage": 95.80276417867884,
#         "Status": 5,
#         "AccumulatedRainfall": 0,
#         "YesterdayAccumulatedRainfall": 0,
#         "EffectiveCapacity": 18796.18
#       },
#       {
#         "StationNo": "20501",
#         "StationName": {
#           "zh_TW": "霧社水庫"
#         },
#         "Time": "2025-02-26T07:00:00+00:00",
#         "EffectiveStorage": 2083.56,
#         "PercentageOfStorage": 72.63435312491285,
#         "Status": 5,
#         "YesterdayAccumulatedRainfall": 0,
#         "EffectiveCapacity": 2868.56
#       },
#       {
#         "StationNo": "20502",
#         "StationName": {
#           "zh_TW": "日月潭水庫"
#         },
#         "Time": "2025-02-26T07:00:00+00:00",
#         "EffectiveStorage": 12222.92,
#         "PercentageOfStorage": 94.39211558495616,
#         "Status": 5,
#         "YesterdayAccumulatedRainfall": 0,
#         "EffectiveCapacity": 12949.09
#       },
#       {
#         "StationNo": "20503",
#         "StationName": {
#           "zh_TW": "集集攔河堰"
#         },
#         "Time": "2025-02-26T07:00:00+00:00",
#         "EffectiveStorage": 68.76,
#         "PercentageOfStorage": 11.405254777070065,
#         "Status": 5,
#         "YesterdayAccumulatedRainfall": 0,
#         "EffectiveCapacity": 531.61
#       },
#       {
#         "StationNo": "20509",
#         "StationName": {
#           "zh_TW": "湖山水庫"
#         },
#         "Time": "2025-02-26T10:00:00+00:00",
#         "EffectiveStorage": 3489.66,
#         "PercentageOfStorage": 68.9552421068689,
#         "Status": 5,
#         "YesterdayAccumulatedRainfall": 0,
#         "EffectiveCapacity": 5060.761
#       }
#     ]
#   },
#   {
#     "AreaCode": "A03",
#     "AreaName": "南區",
#     "ReservoirRealTimeInfos": [
#       {
#         "StationNo": "30301",
#         "StationName": {
#           "zh_TW": "仁義潭水庫"
#         },
#         "Time": "2025-02-26T07:00:00+00:00",
#         "EffectiveStorage": 1282.09,
#         "PercentageOfStorage": 51.99742058985757,
#         "Status": 5,
#         "AccumulatedRainfall": 0,
#         "YesterdayAccumulatedRainfall": 0,
#         "EffectiveCapacity": 2465.68
#       },
#       {
#         "StationNo": "30401",
#         "StationName": {
#           "zh_TW": "白河水庫"
#         },
#         "Time": "2025-02-26T08:00:00+00:00",
#         "EffectiveStorage": 478,
#         "PercentageOfStorage": 34.04180162318147,
#         "Status": 5,
#         "YesterdayAccumulatedRainfall": 0,
#         "EffectiveCapacity": 1404.156
#       },
#       {
#         "StationNo": "30501",
#         "StationName": {
#           "zh_TW": "烏山頭水庫"
#         },
#         "Time": "2025-02-26T07:00:00+00:00",
#         "EffectiveStorage": 7082,
#         "PercentageOfStorage": 91.52305503492467,
#         "Status": 5,
#         "YesterdayAccumulatedRainfall": 0,
#         "EffectiveCapacity": 7737.941
#       },
#       {
#         "StationNo": "30502",
#         "StationName": {
#           "zh_TW": "曾文水庫"
#         },
#         "Time": "2025-02-26T09:00:00+00:00",
#         "EffectiveStorage": 40485,
#         "PercentageOfStorage": 82.31770714777757,
#         "Status": 5,
#         "AccumulatedRainfall": 0,
#         "YesterdayAccumulatedRainfall": 0,
#         "EffectiveCapacity": 49181.399
#       },
#       {
#         "StationNo": "30503",
#         "StationName": {
#           "zh_TW": "南化水庫"
#         },
#         "Time": "2025-02-26T07:00:00+00:00",
#         "EffectiveStorage": 7788.55,
#         "PercentageOfStorage": 87.31460409636664,
#         "Status": 5,
#         "AccumulatedRainfall": 0,
#         "YesterdayAccumulatedRainfall": 0,
#         "EffectiveCapacity": 8920.1
#       },
#       {
#         "StationNo": "30802",
#         "StationName": {
#           "zh_TW": "阿公店水庫"
#         },
#         "Time": "2025-02-26T09:00:00+00:00",
#         "EffectiveStorage": 1146,
#         "PercentageOfStorage": 78.06943683732945,
#         "Status": 5,
#         "AccumulatedRainfall": 0,
#         "YesterdayAccumulatedRainfall": 0,
#         "EffectiveCapacity": 1467.924
#       },
#       {
#         "StationNo": "31201",
#         "StationName": {
#           "zh_TW": "牡丹水庫"
#         },
#         "Time": "2025-02-26T09:00:00+00:00",
#         "EffectiveStorage": 2174,
#         "PercentageOfStorage": 82.91127654381255,
#         "Status": 5,
#         "AccumulatedRainfall": 0,
#         "YesterdayAccumulatedRainfall": 3.5,
#         "EffectiveCapacity": 2622.08
#       }
#     ]
#   }
# ]
