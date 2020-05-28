using coffee.Models.temp;
using coffee.Services;
using Microsoft.AspNetCore.Mvc;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using OfficeOpenXml.Table;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;

namespace coffee.Controllers
{
    public class ExcelController : Controller
    {
        private readonly IStatistical _statisticalRepository;
        private List<BillsTemp> bills;

        public ExcelController(IStatistical statisticalRepository)
        {
            _statisticalRepository = statisticalRepository;
        }

        //public IActionResult Index()
        //{
        //    //var file = new FileInfo(@"C:\Users\dannnl\Documents\myWorkbook3.xlsx");
        //    //using (var package = new ExcelPackage(file))
        //    //{
        //    //    var sheet = package.Workbook.Worksheets.Add("My Sheet");
        //    //    sheet.Cells["A1"].Value = "Hello World!";

        //    //    // Save to file
        //    //    package.Save();
        //    //}


        //    //byte[] fileContents;
        //    //using (var package = new ExcelPackage())
        //    //{
        //    //    var workSheet = package.Workbook.Worksheets.Add("SheetA");

        //    //    workSheet.Cells["A1"].Value = "hello";
        //    //    workSheet.Cells["A1"].Style.Font.Size = 20;
        //    //    workSheet.Cells["A1"].Style.Font.Bold = true;
        //    //    workSheet.Cells["A1"].Style.Border.Top.Style = ExcelBorderStyle.MediumDashDot;


        //    //    workSheet.Cells["A3"].Value = "hello2";
        //    //    workSheet.Cells["A3"].Style.Font.Size = 20;
        //    //    workSheet.Cells["A3"].Style.Font.Bold = true;
        //    //    workSheet.Cells["A3"].Style.Border.Top.Style = ExcelBorderStyle.MediumDashDot;


        //    //    workSheet.Cells["C2"].Value = "hello3";
        //    //    workSheet.Cells["C2"].Style.Font.Size = 20;
        //    //    workSheet.Cells["C2"].Style.Font.Bold = true;
        //    //    workSheet.Cells["C2"].Style.Border.Top.Style = ExcelBorderStyle.MediumDashDot;


        //    //    fileContents = package.GetAsByteArray();
        //    //}

        //    //if(fileContents == null || fileContents.Length == 0)
        //    //{
        //    //    return NotFound();
        //    //}

        //    //return File(
        //    //    fileContents: fileContents,
        //    //    contentType: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
        //    //    fileDownloadName: "Hello2.xlsx"
        //    //    );

        //    byte[] fileContents;
        //    ExcelPackage ExcelPkg = new ExcelPackage();
        //    ExcelWorksheet wsSheet1 = ExcelPkg.Workbook.Worksheets.Add("Sheet1");
        //    using (ExcelRange Rng = wsSheet1.Cells["B2:I2"])
        //    {
        //        Rng.Value = "Everyday Be Coding - Format Table using EPPlus .Net Library - Part 15(B)";
        //        Rng.Merge = true;
        //        Rng.Style.Font.Size = 16;
        //        Rng.Style.Font.Bold = true;
        //        Rng.Style.Font.Italic = true;
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["B4:G12"])
        //    {
        //        ExcelTableCollection tblcollection = wsSheet1.Tables;
        //        ExcelTable table = tblcollection.Add(Rng, "tblSalesman");
        //        //Set Columns position & name  
        //        table.Columns[0].Name = "Id";
        //        table.Columns[1].Name = "Salesman Name";
        //        table.Columns[2].Name = "Sales Amount";
        //        table.Columns[3].Name = "Profits";
        //        table.Columns[4].Name = "Country";
        //        table.Columns[5].Name = "Date";
        //        //table.ShowHeader = false;  
        //        table.ShowFilter = true;
        //        table.ShowTotal = true;
        //        //Add TotalsRowFormula into Excel table Columns  
        //        table.Columns[0].TotalsRowLabel = "Total Rows";
        //        //table.Columns[1].TotalsRowFormula = "SUBTOTAL(102,[Id])"; //102 = Count  
        //        //table.Columns[2].TotalsRowFormula = "SUBTOTAL(109,[Sales Amount])"; //109 = Sum  
        //        //table.Columns[3].TotalsRowFormula = "SUBTOTAL(101,[Profits])"; //101 = Average  
        //        //Add TotalsRowFunction into Excel table Columns  
        //        table.Columns[0].TotalsRowLabel = "Total Rows";
        //        table.Columns[1].TotalsRowFunction = RowFunctions.Count;
        //        table.Columns[2].TotalsRowFunction = RowFunctions.Sum;
        //        table.Columns[3].TotalsRowFunction = RowFunctions.Average;
        //        table.TableStyle = TableStyles.Dark9;
        //    }
        //    //Insert data into the Excel Table Cells  
        //    //"ID" Column  
        //    string IntCellFormat = "###0;";
        //    using (ExcelRange Rng = wsSheet1.Cells["B5"])
        //    {
        //        Rng.Style.Numberformat.Format = IntCellFormat;
        //        Rng.Value = Convert.ToInt32("1001");
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["B6"])
        //    {
        //        Rng.Style.Numberformat.Format = IntCellFormat;
        //        Rng.Value = Convert.ToInt32("1002");
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["B7"])
        //    {
        //        Rng.Style.Numberformat.Format = IntCellFormat;
        //        Rng.Value = Convert.ToInt32("1003");
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["B8"])
        //    {
        //        Rng.Style.Numberformat.Format = IntCellFormat;
        //        Rng.Value = Convert.ToInt32("1004");
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["B9"])
        //    {
        //        Rng.Style.Numberformat.Format = IntCellFormat;
        //        Rng.Value = Convert.ToInt32("1005");
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["B10"])
        //    {
        //        Rng.Style.Numberformat.Format = IntCellFormat;
        //        Rng.Value = Convert.ToInt32("1006");
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["B11"])
        //    {
        //        Rng.Style.Numberformat.Format = IntCellFormat;
        //        Rng.Value = Convert.ToInt32("1007");
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["B12"])
        //    {
        //        Rng.Style.Numberformat.Format = IntCellFormat;
        //        Rng.Value = Convert.ToInt32("1008");
        //    }
        //    //"Salesman Name" Column  
        //    using (ExcelRange Rng = wsSheet1.Cells["C5"])
        //    {
        //        Rng.Value = "John";
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["C6"])
        //    {
        //        Rng.Value = "Sunil";
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["C7"])
        //    {
        //        Rng.Value = "Smith";
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["C8"])
        //    {
        //        Rng.Value = "Rohit";
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["C9"])
        //    {
        //        Rng.Value = "Matt";
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["C10"])
        //    {
        //        Rng.Value = "Jack";
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["C11"])
        //    {
        //        Rng.Value = "johnson";
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["C12"])
        //    {
        //        Rng.Value = "Brown";
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["C12"])
        //    {
        //        Rng.Value = "Brown";
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["C13"])
        //    {
        //        Rng.Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
        //    }
        //    //"Sales Amount" Column   
        //    string CurrencyCellFormat = "$###,###,##0.00";
        //    using (ExcelRange Rng = wsSheet1.Cells["D5"])
        //    {
        //        Rng.Style.Numberformat.Format = CurrencyCellFormat;
        //        Rng.Value = Convert.ToDecimal("700.00");
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["D6"])
        //    {
        //        Rng.Style.Numberformat.Format = CurrencyCellFormat;
        //        Rng.Value = Convert.ToDecimal("800.00");
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["D7"])
        //    {
        //        Rng.Style.Numberformat.Format = CurrencyCellFormat;
        //        Rng.Value = Convert.ToDecimal("1000.00");
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["D8"])
        //    {
        //        Rng.Style.Numberformat.Format = CurrencyCellFormat;
        //        Rng.Value = Convert.ToDecimal("1100.00");
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["D9"])
        //    {
        //        Rng.Style.Numberformat.Format = CurrencyCellFormat;
        //        Rng.Value = Convert.ToDecimal("5000.00");
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["D10"])
        //    {
        //        Rng.Style.Numberformat.Format = CurrencyCellFormat;
        //        Rng.Value = Convert.ToDecimal("200.00");
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["D11"])
        //    {
        //        Rng.Style.Numberformat.Format = CurrencyCellFormat;
        //        Rng.Value = Convert.ToDecimal("100.00");
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["D12"])
        //    {
        //        Rng.Style.Numberformat.Format = CurrencyCellFormat;
        //        Rng.Value = Convert.ToDecimal("200.00");
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["D13"])
        //    {
        //        Rng.Style.Numberformat.Format = CurrencyCellFormat;
        //        Rng.Style.HorizontalAlignment = ExcelHorizontalAlignment.Right;
        //    }
        //    //"Profits" Column  
        //    string PersentageCellFormat = "#0\\.00%";
        //    using (ExcelRange Rng = wsSheet1.Cells["E5"])
        //    {
        //        Rng.Style.Numberformat.Format = PersentageCellFormat;
        //        Rng.Value = Convert.ToDecimal(50.01);
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["E6"])
        //    {
        //        Rng.Style.Numberformat.Format = PersentageCellFormat;
        //        Rng.Value = Convert.ToDecimal(20.02);
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["E7"])
        //    {
        //        Rng.Style.Numberformat.Format = PersentageCellFormat;
        //        Rng.Value = Convert.ToInt32(56.30);
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["E8"])
        //    {
        //        Rng.Style.Numberformat.Format = PersentageCellFormat;
        //        Rng.Value = Convert.ToDecimal(45.90);
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["E9"])
        //    {
        //        Rng.Style.Numberformat.Format = PersentageCellFormat;
        //        Rng.Value = Convert.ToDecimal(90.92);
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["E10"])
        //    {
        //        Rng.Style.Numberformat.Format = PersentageCellFormat;
        //        Rng.Value = Convert.ToDecimal(80.88);
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["E11"])
        //    {
        //        Rng.Style.Numberformat.Format = PersentageCellFormat;
        //        Rng.Value = Convert.ToDecimal(76.90);
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["E12"])
        //    {
        //        Rng.Style.Numberformat.Format = PersentageCellFormat;
        //        Rng.Value = Convert.ToDecimal(39.9);
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["E13"])
        //    {
        //        Rng.Style.Numberformat.Format = PersentageCellFormat;
        //        Rng.Style.HorizontalAlignment = ExcelHorizontalAlignment.Right;
        //    }
        //    //"Country" Column  
        //    using (ExcelRange Rng = wsSheet1.Cells["F5"])
        //    {
        //        Rng.Value = "UK";
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["F6"])
        //    {
        //        Rng.Value = "IND";
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["F7"])
        //    {
        //        Rng.Value = "USA";
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["F8"])
        //    {
        //        Rng.Value = "IND";
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["F9"])
        //    {
        //        Rng.Value = "USA";
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["F10"])
        //    {
        //        Rng.Value = "IND";
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["F11"])
        //    {
        //        Rng.Value = "UK";
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["F12"])
        //    {
        //        Rng.Value = "UK";
        //    }
        //    //"Date" Column  
        //    string DateCellFormat = "mm/dd/yyyy";
        //    using (ExcelRange Rng = wsSheet1.Cells["G5"])
        //    {
        //        Rng.Style.Numberformat.Format = DateCellFormat;
        //        Rng.Value = Convert.ToDateTime("10/30/2016");
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["G6"])
        //    {
        //        Rng.Style.Numberformat.Format = DateCellFormat;
        //        Rng.Value = Convert.ToDateTime("06/23/2017");
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["G7"])
        //    {
        //        Rng.Style.Numberformat.Format = DateCellFormat;
        //        Rng.Value = Convert.ToDateTime("05/13/2017");
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["G8"])
        //    {
        //        Rng.Style.Numberformat.Format = DateCellFormat;
        //        Rng.Value = Convert.ToDateTime("09/10/2017");
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["G9"])
        //    {
        //        Rng.Style.Numberformat.Format = DateCellFormat;
        //        Rng.Value = Convert.ToDateTime("07/26/2017");
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["G10"])
        //    {
        //        Rng.Style.Numberformat.Format = DateCellFormat;
        //        Rng.Value = Convert.ToDateTime("08/26/2017");
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["G11"])
        //    {
        //        Rng.Style.Numberformat.Format = DateCellFormat;
        //        Rng.Value = Convert.ToDateTime("09/10/2017");
        //    }
        //    using (ExcelRange Rng = wsSheet1.Cells["G12"])
        //    {
        //        Rng.Style.Numberformat.Format = DateCellFormat;
        //        Rng.Value = Convert.ToDateTime("09/10/2017");
        //    }
        //    wsSheet1.Cells[wsSheet1.Dimension.Address].AutoFitColumns();
        //    //ExcelPkg.SaveAs(new FileInfo(@"C:\Users\dannnl\Documents\FormatExcelTable.xlsx"));
        //    fileContents = ExcelPkg.GetAsByteArray();
        //    if (fileContents == null || fileContents.Length == 0)
        //    {
        //        return NotFound();
        //    }

        //    return File(
        //        fileContents: fileContents,
        //        contentType: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
        //        fileDownloadName: "Hello4.xlsx"
        //        );
        //}

        //public IActionResult Index()
        //{
        //    List<Cataloges> cata = new List<Cataloges>
        //    {
        //        new Cataloges() { id = 1, name = "dan", isDeleted = false, created_at = DateTime.Now },
        //        new Cataloges() { id = 2, name = "dan2", isDeleted = false, created_at = DateTime.Now },
        //        new Cataloges() { id = 3, name = "dan3", isDeleted = false, created_at = DateTime.Now },
        //        new Cataloges() { id = 4, name = "dan4", isDeleted = false, created_at = DateTime.Now }
        //    };

        //    byte[] fileContents;
        //    using (var package = new ExcelPackage())
        //    {
        //        var ws = package.Workbook.Worksheets.Add("SheetA");

        //        // Create table from dataTable with header
        //        ws.Cells["B2"].LoadFromCollection(cata, true, TableStyles.Medium6);
        //        //ws.Cells[2, 2].LoadFromCollection(cata, true, TableStyles.Medium6);

        //        //string dateformat = System.Globalization.DateTimeFormatInfo.CurrentInfo.ShortDatePattern;
        //        //ws.Column(8).Style.Numberformat.Format = dateformat;


        //        ws.Column(8).Style.Numberformat.Format = "dd-MM-yyyy HH:mm:ss";


        //        // Autofit Columns               
        //        ws.Cells[ws.Dimension.Address].AutoFitColumns();

        //        // Send to browser
        //        fileContents = package.GetAsByteArray();
        //    }

        //    if (fileContents == null || fileContents.Length == 0)
        //    {
        //        return NotFound();
        //    }

        //    return File(
        //        fileContents: fileContents,
        //        contentType: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
        //        fileDownloadName: "Hello7.xlsx"
        //        );
        //}




        [HttpGet("excel/{startDate?}/{endDate?}")]
        public IActionResult Index(string startDate, string endDate)
        {
            var title = "";
            if (startDate == null)
                bills = _statisticalRepository.GetAllBills();
            else
            {
                if (startDate.Equals(endDate))
                    title = " NGÀY " + Convert.ToDateTime(startDate).ToString("dd-MM-yyyy");
                else
                    title = " TỪ " + Convert.ToDateTime(startDate).ToString("dd-MM-yyyy") + " ĐẾN " + Convert.ToDateTime(endDate).ToString("dd-MM-yyyy");
                bills = _statisticalRepository.GetAllBillsByDate(startDate, endDate);
            }


            byte[] fileContents;
            using (var package = new ExcelPackage())
            {
                var ws = package.Workbook.Worksheets.Add("Sheet1");
                var titlePosition = "B2:F3";
                var datePosition = "B5:D5";
                var tablePosition = "B6";

                // Create table from dataTable with header
                ws.Cells[tablePosition].LoadFromCollection(bills, true, TableStyles.Medium14);
                //ws.Cells[2, 2].LoadFromCollection(cata, true, TableStyles.Medium6);

                ws.Cells[titlePosition].Merge = true;
                ws.Cells[titlePosition].Value = "THỐNG KÊ DOANH THU" + title;
                ws.Cells[titlePosition].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                ws.Cells[titlePosition].Style.Font.Size = 20;
                ws.Cells[titlePosition].Style.Font.Bold = true;

                ws.Cells[datePosition].Merge = true;
                ws.Cells["B5"].Value = "Ngày tạo: " + DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");

                var tableFirstRow = 7;
                var tableLastRow = ws.Dimension.End.Row;
                var totalIndex = tableLastRow + 1;

                for (int i = tableFirstRow; i < totalIndex; i++)
                {
                    using (ExcelRange Rng = ws.Cells["D" + i])
                    {
                        if (!string.IsNullOrEmpty(Rng.Text))
                        {
                            //string[] commentWords = Rng.Value.ToString().Split(' ');
                            //Rng.Value = commentWords[0] + "...";

                            //string comment = string.Join(Environment.NewLine, commentWords
                            //    .Select((word, index) => new { word, index })
                            //    .GroupBy(x => x.index / 4)
                            //    .Select(grp => string.Join(" ", grp.Select(x => x.word)))
                            //    );


                            //ExcelComment cmd = Rng.AddComment(comment, "Apt. Notes");
                            ExcelComment cmd = Rng.AddComment(Rng.Value.ToString(), "Apt. Notes");
                            //cmd.AutoFit = true;
                        }
                    }

                };

                ws.Column(5).Style.Numberformat.Format = "dd-MM-yyyy HH:mm:ss";
                ws.Column(6).Style.Numberformat.Format = "#,##0 [$VND]";

                ws.Cells["B" + totalIndex].Value = "Tổng Cộng";
                ws.Cells["F" + totalIndex].Formula = "=SUM(F" + tableFirstRow + ":F" + (totalIndex - 1) + ")";
                ws.Cells["B" + totalIndex + ":F" + totalIndex].Style.Fill.PatternType = ExcelFillStyle.Solid;
                ws.Cells["B" + totalIndex + ":F" + totalIndex].Style.Fill.BackgroundColor.SetColor(Color.FromArgb(112, 173, 71));
                ws.Cells["B" + totalIndex + ":F" + totalIndex].Style.Font.Color.SetColor(Color.White);
                ws.Cells["B" + totalIndex + ":F" + totalIndex].Style.Font.Bold = true;

                ws.Cells["B" + tableFirstRow + ":B" + totalIndex].Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                ws.Cells["E" + tableFirstRow + ":E" + totalIndex].Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                ws.Cells[tablePosition + ":F6"].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;

                ws.Cells[tablePosition].Value = "#";
                for (int i = 0; i < bills.Count(); i++)
                {
                    ws.Cells["B" + (tableFirstRow + i)].Value = i + 1;
                }

                // Autofit Columns               
                ws.Cells[ws.Dimension.Address].AutoFitColumns();
                for (int col = 1; col <= ws.Dimension.End.Column; col++)
                {
                    ws.Column(col).Width = ws.Column(col).Width + 2;
                }
                ws.Cells["D7"].AutoFitColumns(50.00, 60.00);
                // Send to browser
                fileContents = package.GetAsByteArray();
            }

            //using (ExcelPackage excelPackage = new ExcelPackage())
            //{
            //    //create the WorkSheet
            //    ExcelWorksheet worksheet = excelPackage.Workbook.Worksheets.Add("Sheet 1");

            //    //add some dummy data, note that row and column indexes start at 1
            //    for (int i = 1; i <= 30; i++)
            //    {
            //        for (int j = 1; j <= 15; j++)
            //        {
            //            worksheet.Cells[i, j].Value = "Row " + i + ", Column " + j;
            //        }
            //    }

            //    //fill column A with solid red color
            //    worksheet.Column(1).Style.Fill.PatternType = ExcelFillStyle.Solid;
            //    worksheet.Column(1).Style.Fill.BackgroundColor.SetColor(ColorTranslator.FromHtml("#FF0000"));

            //    //set the font type for cells C1 - C30
            //    worksheet.Cells["C1:C30"].Style.Font.Size = 13;
            //    worksheet.Cells["C1:C30"].Style.Font.Name = "Calibri";
            //    worksheet.Cells["C1:C30"].Style.Font.Bold = true;
            //    worksheet.Cells["C1:C30"].Style.Font.Color.SetColor(Color.Blue);

            //    //fill row 4 with striped orange background
            //    worksheet.Row(4).Style.Fill.PatternType = ExcelFillStyle.DarkHorizontal;
            //    worksheet.Row(4).Style.Fill.BackgroundColor.SetColor(Color.Orange);

            //    //make the borders of cell F6 thick
            //    worksheet.Cells[6, 6].Style.Border.Top.Style = ExcelBorderStyle.Thick;
            //    worksheet.Cells[6, 6].Style.Border.Right.Style = ExcelBorderStyle.Thick;
            //    worksheet.Cells[6, 6].Style.Border.Bottom.Style = ExcelBorderStyle.Thick;
            //    worksheet.Cells[6, 6].Style.Border.Left.Style = ExcelBorderStyle.Thick;

            //    //make the borders of cells A18 - J18 double and with a purple color
            //    worksheet.Cells["A18:J18"].Style.Border.Top.Style = ExcelBorderStyle.Double;
            //    worksheet.Cells["A18:J18"].Style.Border.Bottom.Style = ExcelBorderStyle.Double;
            //    worksheet.Cells["A18:J18"].Style.Border.Top.Color.SetColor(Color.Purple);
            //    worksheet.Cells["A18:J18"].Style.Border.Bottom.Color.SetColor(Color.Purple);

            //    //make all text fit the cells
            //    worksheet.Cells[worksheet.Dimension.Address].AutoFitColumns();

            //    //i use this to make all columms just a bit wider, text would sometimes still overflow after AutoFitColumns(). Bug?
            //    for (int col = 1; col <= worksheet.Dimension.End.Column; col++)
            //    {
            //        worksheet.Column(col).Width = worksheet.Column(col).Width + 1;
            //    }

            //    //make column H wider and set the text align to the top and right
            //    worksheet.Column(8).Width = 25;
            //    worksheet.Column(8).Style.HorizontalAlignment = ExcelHorizontalAlignment.Right;
            //    worksheet.Column(8).Style.VerticalAlignment = ExcelVerticalAlignment.Top;

            //    fileContents = excelPackage.GetAsByteArray();
            //}

            if (fileContents == null || fileContents.Length == 0)
            {
                return NotFound();
            }

            return File(
                fileContents: fileContents,
                contentType: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                fileDownloadName: "report.xlsx"
                );
        }
    }
}