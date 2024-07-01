using Microsoft.AspNetCore.SignalR;
using MinifootballAppApi.DTOs;

namespace MinifootballAppApi.Hubs
{
    public class PlayerHub : Hub
    {
        public async Task PlayerUpdated(UserEntityDTO user)
        {
           await Clients.All.SendAsync("PlayerUpdated", user);
        }
    }
}
