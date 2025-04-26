Attribute VB_Name = "USDJPY"
Sub ConvertTextToNumber()
With Range("C2:AV1001")
.NumberFormat = "General"
.Value = .Value
End With
End Sub

Function WorksheetExists(sName As String) As Boolean
    WorksheetExists = Evaluate("ISREF('" & sName & "'!A1)")
End Function

Sub AddAnalyzeTab()
    If Not WorksheetExists("Analyze") Then
        Sheets.Add(After:=Sheets("Results databank")).Name = "Analyze"
    End If
End Sub

Sub FillAnalyzeTabData()
    Sheets("Analyze").Select
    Range("A2").Select
    ActiveCell.FormulaR1C1 = "Win Rate"
    Range("B2").Select
    ActiveCell.FormulaR1C1 = "Profit Factor"
    Range("C2").Select
    ActiveCell.FormulaR1C1 = "Sharpe Ratio"
    Range("D2").Select
    ActiveCell.FormulaR1C1 = "Ret/DD"
    Range("E2").Select
    ActiveCell.FormulaR1C1 = "Net Profit"
    Range("F2").Select
    ActiveCell.FormulaR1C1 = "DD"
    Range("G2").Select
    ActiveCell.FormulaR1C1 = "# of Trades"
    Range("A1:G1").Select
    With Selection
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlBottom
        .WrapText = False
        .Orientation = 0
        .AddIndent = False
        .IndentLevel = 0
        .ShrinkToFit = False
        .ReadingOrder = xlContext
        .MergeCells = False
    End With
    Selection.Merge
    Range("A1:G1").Select
    ActiveCell.FormulaR1C1 = "Base Line"
    Range("A1:G2").Select
    Selection.Copy
    Range("H1").Select
    ActiveSheet.Paste
    Range("H1:N1").Select
    Application.CutCopyMode = False
    ActiveCell.FormulaR1C1 = "Top 10 % of # of Trades"
    Range("H1:N2").Select
    Selection.Copy
    Range("O1").Select
    ActiveSheet.Paste
    Range("O1:U1").Select
    Application.CutCopyMode = False
    Range("O1:U1").Select
    ActiveCell.FormulaR1C1 = "Top 10 % of Profit Factor"
    Range("O1:U2").Select
    Selection.Copy
    Range("V1").Select
    ActiveSheet.Paste
    Application.CutCopyMode = False
    Range("V1:AB1").Select
    ActiveCell.FormulaR1C1 = "Top 10 % of Sharpe Ratio"
    Range("V1:AB2").Select
    Selection.Copy
    Range("AC1").Select
    ActiveSheet.Paste
    Range("AC1:AI1").Select
    Application.CutCopyMode = False
    ActiveCell.FormulaR1C1 = "Top 10 % of RET/DD Ratio"
    Range("AC1:AI2").Select
    Selection.Copy
    Range("AJ1").Select
    ActiveSheet.Paste
    Range("AJ1:AP1").Select
    Application.CutCopyMode = False
    ActiveCell.FormulaR1C1 = "Training"
    Range("A3").Select
    ActiveCell.FormulaR1C1 = _
        "=COUNTIF('Results databank'!R2C2:'Results databank'!R1001C2,""PASSED"")/COUNTA('Results databank'!R2C2:'Results databank'!R1001C2)"
    Range("B3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGE('Results databank'!C[27])"
    Range("C3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGE('Results databank'!C[27])"
    Range("D3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGE('Results databank'!C[33])"
    Range("E3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGE('Results databank'!C[21])"
    Range("F3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGE('Results databank'!C[29])"
    Range("G3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGE('Results databank'!C[21])"
    Range("H3").Select
    ActiveCell.FormulaR1C1 = "=COUNTIFS('Results databank'!C[0]:C[0],"">=""&PERCENTILE('Results databank'!C[0]:C[0],0.9), 'Results databank'!C[-6]:C[-6], ""PASSED"") / COUNTIF('Results databank'!C[0]:C[0],"">=""&PERCENTILE('Results databank'!C[0]:C[0],0.9))"
    Range("I3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGEIF('Results databank'!C[-1]:C[-1],"">=""&PERCENTILE('Results databank'!C[-1]:C[-1],0.9),'Results databank'!C[20]:C[20])"
    Range("J3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGEIF('Results databank'!C[-2]:C[-2],"">=""&PERCENTILE('Results databank'!C[-2]:C[-2],0.9),'Results databank'!C[20]:C[20])"
    Range("K3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGEIF('Results databank'!C[-3]:C[-3],"">=""&PERCENTILE('Results databank'!C[-3]:C[-3],0.9),'Results databank'!C[26]:C[26])"
    Range("L3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGEIF('Results databank'!C[-4]:C[-4],"">=""&PERCENTILE('Results databank'!C[-4]:C[-4],0.9),'Results databank'!C[14]:C[14])"
    Range("M3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGEIF('Results databank'!C[-5]:C[-5],"">=""&PERCENTILE('Results databank'!C[-5]:C[-5],0.9),'Results databank'!C[22]:C[22])"
    Range("N3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGEIF('Results databank'!C[-6]:C[-6],"">=""&PERCENTILE('Results databank'!C[-6]:C[-6],0.9),'Results databank'!C[14]:C[14])"
    Range("O3").Select
    ActiveCell.FormulaR1C1 = "=COUNTIFS('Results databank'!C[-6]:C[-6],"">=""&PERCENTILE('Results databank'!C[-6]:C[-6],0.9), 'Results databank'!C[-13]:C[-13], ""PASSED"") / COUNTIF('Results databank'!C[-6]:C[-6],"">=""&PERCENTILE('Results databank'!C[-6]:C[-6],0.9))"
    Range("P3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGEIF('Results databank'!C[-7]:C[-7],"">=""&PERCENTILE('Results databank'!C[-7]:C[-7],0.9),'Results databank'!C[13]:C[13])"
    Range("Q3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGEIF('Results databank'!C[-8]:C[-8],"">=""&PERCENTILE('Results databank'!C[-8]:C[-8],0.9),'Results databank'!C[13]:C[13])"
    Range("R3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGEIF('Results databank'!C[-9]:C[-9],"">=""&PERCENTILE('Results databank'!C[-9]:C[-9],0.9),'Results databank'!C[19]:C[19])"
    Range("S3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGEIF('Results databank'!C[-10]:C[-10],"">=""&PERCENTILE('Results databank'!C[-10]:C[-10],0.9),'Results databank'!C[7]:C[7])"
    Range("T3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGEIF('Results databank'!C[-11]:C[-11],"">=""&PERCENTILE('Results databank'!C[-11]:C[-11],0.9),'Results databank'!C[15]:C[15])"
    Range("U3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGEIF('Results databank'!C[-12]:C[-12],"">=""&PERCENTILE('Results databank'!C[-12]:C[-12],0.9),'Results databank'!C[7]:C[7])"
    Range("V3").Select
    ActiveCell.FormulaR1C1 = "=COUNTIFS('Results databank'!C[-12]:C[-12],"">=""&PERCENTILE('Results databank'!C[-12]:C[-12],0.9), 'Results databank'!C[-20]:C[-20], ""PASSED"") / COUNTIF('Results databank'!C[-12]:C[-12],"">=""&PERCENTILE('Results databank'!C[-12]:C[-12],0.9))"
    Range("W3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGEIF('Results databank'!C[-13]:C[-13],"">=""&PERCENTILE('Results databank'!C[-13]:C[-13],0.9),'Results databank'!C[6]:C[6])"
    Range("X3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGEIF('Results databank'!C[-14]:C[-14],"">=""&PERCENTILE('Results databank'!C[-14]:C[-14],0.9),'Results databank'!C[6]:C[6])"
    Range("Y3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGEIF('Results databank'!C[-15]:C[-15],"">=""&PERCENTILE('Results databank'!C[-15]:C[-15],0.9),'Results databank'!C[12]:C[12])"
    Range("Z3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGEIF('Results databank'!C[-16]:C[-16],"">=""&PERCENTILE('Results databank'!C[-16]:C[-16],0.9),'Results databank'!C[0]:C[0])"
    Range("AA3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGEIF('Results databank'!C[-17]:C[-17],"">=""&PERCENTILE('Results databank'!C[-17]:C[-17],0.9),'Results databank'!C[8]:C[8])"
    Range("AB3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGEIF('Results databank'!C[-18]:C[-18],"">=""&PERCENTILE('Results databank'!C[-18]:C[-18],0.9),'Results databank'!C[0]:C[0])"
    Range("AC3").Select
    ActiveCell.FormulaR1C1 = "=COUNTIFS('Results databank'!C[-12]:C[-12],"">=""&PERCENTILE('Results databank'!C[-12]:C[-12],0.9), 'Results databank'!C[-27]:C[-27], ""PASSED"") / COUNTIF('Results databank'!C[-12]:C[-12],"">=""&PERCENTILE('Results databank'!C[-12]:C[-12],0.9))"
    Range("AD3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGEIF('Results databank'!C[-13]:C[-13],"">=""&PERCENTILE('Results databank'!C[-13]:C[-13],0.9),'Results databank'!C[-1]:C[-1])"
    Range("AE3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGEIF('Results databank'!C[-14]:C[-14],"">=""&PERCENTILE('Results databank'!C[-14]:C[-14],0.9),'Results databank'!C[-1]:C[-1])"
    Range("AF3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGEIF('Results databank'!C[-15]:C[-15],"">=""&PERCENTILE('Results databank'!C[-15]:C[-15],0.9),'Results databank'!C[5]:C[5])"
    Range("AG3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGEIF('Results databank'!C[-16]:C[-16],"">=""&PERCENTILE('Results databank'!C[-16]:C[-16],0.9),'Results databank'!C[-7]:C[-7])"
    Range("AH3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGEIF('Results databank'!C[-17]:C[-17],"">=""&PERCENTILE('Results databank'!C[-17]:C[-17],0.9),'Results databank'!C[1]:C[1])"
    Range("AI3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGEIF('Results databank'!C[-18]:C[-18],"">=""&PERCENTILE('Results databank'!C[-18]:C[-18],0.9),'Results databank'!C[-7]:C[-7])"
    Range("AJ3").Select
    ActiveCell.FormulaR1C1 = "=COUNTIF('Results databank'!C[-34], ""PASSED"") / (COUNTA('Results databank'!C[-34])-1)"
    Range("AK3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGE('Results databank'!C[-28])"
    Range("AL3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGE('Results databank'!C[-28])"
    Range("AM3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGE('Results databank'!C[-22])"
    Range("AN3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGE('Results databank'!C[-34])"
    Range("AO3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGE('Results databank'!C[-26])"
    Range("AP3").Select
    ActiveCell.FormulaR1C1 = "=AVERAGE('Results databank'!C[-34])"
End Sub