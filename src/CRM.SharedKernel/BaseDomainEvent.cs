using System;

namespace CRM.SharedKernel
{
    public abstract class BaseDomainEvent
    {
        public DateTime DateOccurred { get; protected set; } = DateTime.UtcNow;
    }
}