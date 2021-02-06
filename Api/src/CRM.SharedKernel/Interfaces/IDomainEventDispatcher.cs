using CRM.SharedKernel;
using System.Threading.Tasks;

namespace CRM.SharedKernel.Interfaces
{
    public interface IDomainEventDispatcher
    {
        Task Dispatch(BaseDomainEvent domainEvent);
    }
}