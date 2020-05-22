using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using coffee.Models;
using coffee.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace coffee.API
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderAPIController : ControllerBase
    {
        private readonly IOrder _orderRepository;
        private int BillsId;

        public OrderAPIController(IOrder orderRepository)
        {
            _orderRepository = orderRepository;
        }

        //[HttpPost]
        //public IActionResult PostOrder(string[] filters)
        //{
        //    Console.Write("=====================================================");
        //    Console.Write("=====================================================" + filters);
        //    Console.Write("=====================================================" + filters.First());
        //    return Content(filters.First());
        //}

        //[HttpPost]
        //public ActionResult postMessage([FromBody] IEnumerable<BillDetails> model)
        //{
        //    return Ok(new { data = model });
        //}

        //[HttpPost]
        //public ActionResult PostOrder([FromBody] dynamic[] model)
        //{
        //    Console.WriteLine(model[0]);
        //    Console.WriteLine(model[0].price);
        //    Console.WriteLine(model[0].name);
        //    foreach (dynamic item in model)
        //    {
        //        item.created_by = "dan";
        //        _orderRepository.AddBill_BillDetail(item);
        //    }
        //    return Ok(model);
        //}

        //[HttpPost]
        //public ActionResult PostOrder([FromBody] dynamic model)
        //{
        //    foreach (dynamic item in model.orderList)
        //    {
        //        item.created_by = "dan";
        //        string note = model.note;
        //        _orderRepository.AddBill_BillDetail(item, note);
        //    }
        //    return Ok(model);
        //}

        [HttpPost]
        public ActionResult PostOrder([FromBody] dynamic order)
        {
            BillsId = _orderRepository.AddBill("dan", order);
            _orderRepository.AddBillDetail(BillsId, order);
            decimal total = order.total;
            _orderRepository.EditBill(total, BillsId);
            return NoContent();
        }
    }
}