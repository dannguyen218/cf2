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
        private List<ProductsTemp> products;
        private List<CatalogesTemp> cataloges;

        public ExcelController(IStatistical statisticalRepository)
        {
            _statisticalRepository = statisticalRepository;
        }

        [HttpGet("excel/{startDate?}/{endDate?}")]
        public IActionResult Index(string startDate, string endDate)
        {
            var title = "";
            if (startDate == null)
            {
                bills = _statisticalRepository.GetAllBills();
                products = _statisticalRepository.GetTopProducts();
                cataloges = _statisticalRepository.GetTopCataloges();
            }
            else
            {
                if (startDate.Equals(endDate))
                    title = " NGÀY " + Convert.ToDateTime(startDate).ToString("dd-MM-yyyy");
                else
                    title = " TỪ " + Convert.ToDateTime(startDate).ToString("dd-MM-yyyy") + " ĐẾN " + Convert.ToDateTime(endDate).ToString("dd-MM-yyyy");
                bills = _statisticalRepository.GetAllBillsByDate(startDate, endDate);
                products = _statisticalRepository.GetTopProductsByDate(startDate, endDate);
                cataloges = _statisticalRepository.GetTopCatalogesByDate(startDate, endDate);
            }


            byte[] fileContents;
            using (var package = new ExcelPackage())
            {
                var ws = package.Workbook.Worksheets.Add("Sheet1");
                var titlePosition = "B2:F3";
                var datePosition = "B5:D5";
                var tablePosition = 6;
                var tableFirstRow = 7;


                //===========================================Bang doanh thu==================================================
                ws.Cells["B" + tablePosition].LoadFromCollection(bills, true, TableStyles.Medium14);

                var tableLastRow = ws.Dimension.End.Row;
                var tbBillLastRow = tableLastRow + 1;

                ws.Cells[titlePosition].Merge = true;
                ws.Cells[titlePosition].Value = "THỐNG KÊ DOANH THU" + title;
                ws.Cells[titlePosition].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                ws.Cells[titlePosition].Style.Font.Size = 20;
                ws.Cells[titlePosition].Style.Font.Bold = true;

                ws.Cells[datePosition].Merge = true;
                ws.Cells[datePosition].Value = "Ngày tạo: " + DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");

                for (int i = tableFirstRow; i < tbBillLastRow; i++)
                {
                    using (ExcelRange Rng = ws.Cells["D" + i])
                    {
                        if (!string.IsNullOrEmpty(Rng.Text))
                        {
                            ExcelComment cmd = Rng.AddComment(Rng.Value.ToString(), "Apt. Notes");
                        }
                    }

                };

                ws.Column(5).Style.Numberformat.Format = "dd-MM-yyyy HH:mm:ss";
                ws.Column(6).Style.Numberformat.Format = "#,##0 [$VND]";

                ws.Cells["B" + tbBillLastRow].Value = "Tổng Cộng";
                ws.Cells["F" + tbBillLastRow].Formula = "=SUM(F" + tableFirstRow + ":F" + (tbBillLastRow - 1) + ")";
                ws.Cells["B" + tbBillLastRow + ":F" + tbBillLastRow].Style.Fill.PatternType = ExcelFillStyle.Solid;
                ws.Cells["B" + tbBillLastRow + ":F" + tbBillLastRow].Style.Fill.BackgroundColor.SetColor(Color.FromArgb(112, 173, 71));
                ws.Cells["B" + tbBillLastRow + ":F" + tbBillLastRow].Style.Font.Color.SetColor(Color.White);
                ws.Cells["B" + tbBillLastRow + ":F" + tbBillLastRow].Style.Font.Bold = true;

                ws.Cells["B" + tablePosition].Value = "#";
                for (int i = 0; i < bills.Count(); i++)
                {
                    ws.Cells["B" + (tableFirstRow + i)].Value = i + 1;
                }

                //===========================================Bang cataloges==================================================
                var titleCataPosition = "H4:J4";
                var tbCataLastRow = tablePosition + cataloges.Count();
                var totalCata = tbCataLastRow + 1;

                ws.Cells["I" + tablePosition].LoadFromCollection(cataloges, true);
                ws.Cells["H" + tablePosition].Value = "#";
                for (int i = 0; i < cataloges.Count(); i++)
                {
                    ws.Cells["H" + (tableFirstRow + i)].Value = i + 1;
                }

                ws.Cells[titleCataPosition].Value = "TOP DANH MỤC";
                ws.Cells[titleCataPosition].Style.Font.Size = 14;
                ws.Cells[titleCataPosition].Style.Font.Bold = true;
                ws.Cells[titleCataPosition].Merge = true;

                ExcelRange range = ws.Cells["H" + tablePosition + ":J" + tbCataLastRow];
                ExcelTable tab = ws.Tables.Add(range, "TopCataloges");
                tab.TableStyle = TableStyles.Light9;

                ws.Cells["H" + totalCata].Value = "Tổng Cộng";
                ws.Cells["J" + totalCata].Formula = "=SUM(J" + tableFirstRow + ":J" + tbCataLastRow + ")";
                ws.Cells["H" + totalCata + ":J" + totalCata].Style.Fill.PatternType = ExcelFillStyle.Solid;
                ws.Cells["H" + totalCata + ":J" + totalCata].Style.Fill.BackgroundColor.SetColor(Color.FromArgb(155, 194, 230));
                ws.Cells["H" + totalCata + ":J" + totalCata].Style.Font.Color.SetColor(Color.White);
                ws.Cells["H" + totalCata + ":J" + totalCata].Style.Font.Bold = true;

                //===========================================Bang product==================================================

                var titleProductPosition = "L4:P4";

                ws.Cells["M" + tablePosition].LoadFromCollection(products, true);
                ws.Cells["L" + tablePosition].Value = "#";
                for (int i = 0; i < products.Count(); i++)
                {
                    ws.Cells["L" + (7 + i)].Value = i + 1;
                }

                ws.Cells[titleProductPosition].Value = "TOP SẢN PHẨM";
                ws.Cells[titleProductPosition].Style.Font.Size = 14;
                ws.Cells[titleProductPosition].Style.Font.Bold = true;
                ws.Cells[titleProductPosition].Merge = true;

                ExcelRange range2 = ws.Cells["L" + tablePosition + ":" + ws.Dimension.End.Address];
                ExcelTable tab2 = ws.Tables.Add(range2, "TopProducts");
                tab2.TableStyle = TableStyles.Medium4;

                ws.Column(14).Style.Numberformat.Format = "#,##0 [$VND]";
                ws.Column(16).Style.Numberformat.Format = "#,##0 [$VND]";

                //================================================================================================

                ws.Cells["B" + tableFirstRow + ":B" + tbBillLastRow].Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                ws.Cells["E" + tableFirstRow + ":E" + tbBillLastRow].Style.HorizontalAlignment = ExcelHorizontalAlignment.Left;
                ws.Row(6).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                ws.Row(4).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;

                ws.Cells[ws.Dimension.Address].AutoFitColumns();
                for (int col = 1; col <= ws.Dimension.End.Column; col++)
                {
                    ws.Column(col).Width = ws.Column(col).Width + 2;
                }
                ws.Cells["D7"].AutoFitColumns(30.00, 40.00);
                ws.Column(1).Width = 4;
                // Send to browser
                fileContents = package.GetAsByteArray();
            }

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