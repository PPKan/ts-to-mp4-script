@echo off
:: 此批次檔案將遍歷 "in" 資料夾中的所有 .TS 檔案，並使用 ffmpeg 進行轉換，將輸出檔案儲存到 "out" 資料夾。
:: 之後會把"in"資料夾內的ts檔案刪除。
:: 輸出檔案將具有與輸入檔案相同的檔名。

for %%f in (".\in\*.TS") do (
    :: 將 .TS 檔案進行轉換，並將結果儲存為具有相同檔名的 .mp4 檔案，並刪除in資料夾內的檔案
    ffmpeg -i "%%f" -c copy -map 0:v -map 0:a -bsf:a aac_adtstoasc ".\out\%%~nf.mp4" & rm %%f
)

:: 完成轉換並退出
exit