using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace TAO.Models
{
    public class Usage
    {
        private int id { get; set; }
        [DataType(DataType.DateTime)]
        private DateTime date { get; set; }
        private double power { get; set; }
        private double water { get; set; }
        private double temp_in { get; set; }
        private double temp_out { get; set; }
        private int address { get; set; }


    }
}