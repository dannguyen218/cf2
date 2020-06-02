using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace coffee.Services
{
    public interface ICharts
    {
        //List<int> GetChart7Day();
        List<int> GetChart7Day();

        List<int> GetChart7_14Day();

        dynamic GetTopCataloges7Days();
    }
}
