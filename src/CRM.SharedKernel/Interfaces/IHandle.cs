using CRM.SharedKernel;
using System.Threading.Tasks;

namespace CRM.SharedKernel.Interfaces
{
    public interface IHandle<in T> where T : BaseDomainEvent
    {
        Task Handle(T domainEvent);
    }
}