using Microsoft.AspNetCore.SignalR;
using MinifootballAppApi.DTOs;

namespace MinifootballAppApi.Hubs
{
    public class GameHub : Hub
    {
        public async Task UpdatePlayerCount(int gameId, int newPlayerCount)
        {
            await Clients.All.SendAsync("PlayerCountUpdated", gameId, newPlayerCount);
        }

        public async Task MatchCancelledNotification(List<int> userIds, int playerId, int gameId)
        {
            foreach(var uId in userIds)
            {
                await Clients.All.SendAsync("MatchCancelled", uId, gameId);
            }
        }

        public async Task PlayerUpdated(string connectionId, int userId)
        {
            await Clients.Client(connectionId).SendAsync("PlayerUpdated", userId);
            
        }
    }
}
