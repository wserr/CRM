using CRM.SharedKernel;
using CRM.SharedKernel.Interfaces;
using System.Threading.Tasks;

namespace CRM.UnitTests
{
    public class NoOpDomainEventDispatcher : IDomainEventDispatcher
    {
        public Task Dispatch(BaseDomainEvent domainEvent)
        {
            return Task.CompletedTask;
        }
    }
}
