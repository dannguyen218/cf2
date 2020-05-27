using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using coffee.Models.temp;
using coffee.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace coffee.API
{
    [Route("api/[controller]")]
    [ApiController]
    public class StatisticAPIController : ControllerBase
    {
        private readonly IStatistical _statisticalRepository;
        private dynamic result;

        public StatisticAPIController(IStatistical statisticalRepository)
        {
            _statisticalRepository = statisticalRepository;
        }

        [HttpGet]
        public IActionResult GetAllBills()
        {
            result = _statisticalRepository.GetAllBills();
            return Ok(result);
        }

        [HttpGet("bill/{BillsId}")]
        public IActionResult GetBillDetailsByBill(int BillsId)
        {
            result = _statisticalRepository.GetBillDetailsByBill(BillsId);
            return Ok(result);
        }

        [HttpGet("date/{StartDate}/{EndDate}")]
        public IActionResult GetAllBillsByDate(string StartDate, string EndDate)
        {
            result = _statisticalRepository.GetAllBillsByDate(StartDate, EndDate);
            return Ok(result);
        }
    }
}