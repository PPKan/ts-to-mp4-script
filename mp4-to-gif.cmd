@echo off
:: 此批次檔案將遍歷 "in" 資料夾中的所有 .mp4 檔案，並使用 ffmpeg 轉換成 .gif，輸出到 "out" 資料夾
:: 輸出檔案將具有與輸入檔案相同的檔名

for %%f in (".\in\*.mp4") do (
    :: 將當前 .mp4 檔案轉換為 GIF，這裡設定 10 fps 並壓縮大小以減少檔案容量
    ffmpeg -i "%%f" -vf "fps=10,scale=640:-1:flags=lanczos" ".\out\%%~nf.gif"
)

:: 完成轉換並退出
exit