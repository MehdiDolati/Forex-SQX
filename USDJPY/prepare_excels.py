import os, os.path
import win32com.client
import pandas as pd

results=[]
xl=win32com.client.Dispatch("Excel.Application")
xl.visible = False
personal_wb = xl.workbooks.Open(Filename=r"C:\Users\Mehdi\AppData\Roaming\Microsoft\Excel\XLSTART\PERSONAL.XLSB")
subfolders= [f.path for f in os.scandir('.') if f.is_dir()]
for dirname in list(subfolders):
    try:
        if os.path.exists(dirname+"\DatabankExport.xlsx"):
            print(dirname+"\DatabankExport.xlsx")
            wb = xl.Workbooks.Open(os.path.abspath(dirname+"\DatabankExport.xlsx"))
            xl.Application.Run("PERSONAL.XLSB!ConvertTextToNumber")
            xl.Application.Run("PERSONAL.XLSB!AddAnalyzeTab")
            xl.Application.Run("PERSONAL.XLSB!FillAnalyzeTabData")
            ws = wb.Worksheets('Analyze')
            
            baselineWR = ws.Cells(3,1)
            baselinePF = ws.Cells(3,2)
            baselineSR = ws.Cells(3,3)
            baselineRDD = ws.Cells(3,4)
            baselineNP = ws.Cells(3,5)
            baselineDD = ws.Cells(3,6)
            baselineNT = ws.Cells(3,7)
            NofTradesWR = ws.Cells(3,8)
            NofTradesPF = ws.Cells(3,9)
            NofTradesSR = ws.Cells(3,10)
            NofTradesRDD = ws.Cells(3,11)
            NofTradesNP = ws.Cells(3,12)
            NofTradesDD = ws.Cells(3,13)
            NofTradesNT = ws.Cells(3,14)
            PPWR = ws.Cells(3,15)
            PPPF = ws.Cells(3,16)
            PPSR = ws.Cells(3,17)
            PPRDD = ws.Cells(3,18)
            PPNP = ws.Cells(3,19)
            PPDD = ws.Cells(3,20)
            PPNT = ws.Cells(3,21)
            SRWR = ws.Cells(3,22)
            SRPF = ws.Cells(3,23)
            SRSR = ws.Cells(3,24)
            SRRDD = ws.Cells(3,25)
            SRNP = ws.Cells(3,26)
            SRDD = ws.Cells(3,27)
            SRNT = ws.Cells(3,28)
            RDDWR = ws.Cells(3,29)
            RDDPF = ws.Cells(3,30)
            RDDSR = ws.Cells(3,31)
            RDDRDD = ws.Cells(3,32)
            RDDNP = ws.Cells(3,33)
            RDDDD = ws.Cells(3,34)
            RDDNT = ws.Cells(3,35)
            TrainWR = ws.Cells(3,36)
            TrainPF = ws.Cells(3,37)
            TrainSR = ws.Cells(3,38)
            TrainRDD = ws.Cells(3,39)
            TrainNP = ws.Cells(3,40)
            TrainDD = ws.Cells(3,41)
            TrainNT = ws.Cells(3,42)
            results.append({'Dataset' : int(dirname.lstrip(".\\")), 'Baseline Win Rate': baselineWR.Value, 'Baseline Profit Factor': baselinePF.Value, 'Baseline Sharpe Ratio': baselineSR.Value,
                            'Baseline RET-DD': baselineRDD.Value , 'Baseline Profit': baselineNP.Value, 'Baseline DD': baselineDD.Value, 'Baseline #t': baselineNT.Value,
                            'NofTrades Win Rate': NofTradesWR.Value, 'NofTrades Profit Factor': NofTradesPF.Value, 'NofTrades Sharpe Ratio': NofTradesSR.Value,
                            'NofTrades RET-DD': NofTradesRDD.Value , 'NofTrades Profit': NofTradesNP.Value, 'NofTrades DD': NofTradesDD.Value, 'NofTrades #t': NofTradesNT.Value,
                            'PP Win Rate': PPWR.Value, 'PP Profit Factor': PPPF.Value, 'PP Sharpe Ratio': PPSR.Value,
                            'PP RET-DD': PPRDD.Value , 'PP Profit': PPNP.Value, 'PP DD': PPDD.Value, 'PP #t': PPNT.Value,
                            'SR Win Rate': SRWR.Value, 'SR Profit Factor': SRPF.Value, 'SR Sharpe Ratio': SRSR.Value,
                            'SR RET-DD': SRRDD.Value , 'SR Profit': SRNP.Value, 'SR DD': SRDD.Value, 'SR #t': SRNT.Value,
                           'RDD Win Rate': RDDWR.Value, 'RDD Profit Factor': RDDPF.Value, 'RDD Sharpe Ratio': RDDSR.Value, 
                           'RDD RET-DD': RDDRDD.Value , 'RDD Profit': RDDNP.Value, 'RDD DD': RDDDD.Value, 'RDD #t': RDDNT.Value,
                           'Train Win Rate': TrainWR.Value, 'Train Profit Factor': TrainPF.Value, 'Train Sharpe Ratio': TrainSR.Value, 
                           'Train RET-DD': TrainRDD.Value , 'Train Profit': TrainNP.Value, 'Train DD': TrainDD.Value, 'Train #t': TrainNT.Value
                           })
            wb.Close(SaveChanges=1)
            print(dirname)            
    except:
        print("Error found while running the excel macro")
        xl.Quit()
personal_wb.Close()
xl.Quit()
del xl
def fnGetSortField(e):
  return e['Dataset']
results.sort(key=fnGetSortField)
# dataframe with Name and Age columns
df = pd.DataFrame(results)

# create a Pandas Excel writer object using XlsxWriter as the engine
writer = pd.ExcelWriter('demo.xlsx', engine='xlsxwriter')

# write data to the excel sheet
df.to_excel(writer, sheet_name='Sheet1', index=False)

# close file
writer.close()