using System;
using System.Collections.Generic;
using System.Text;

namespace TimeManagementBooking
{
    public interface IBookingProcessor
    {
        public bool Create(int empId, DateTime date, decimal duration);
      
    }
}
