import consumer from "./consumer";

const initRoomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "RoomChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
      },
    });
    console.log(Redis.new.pubsub("NUMPAT", "action_cable/*"))
  }
}

export { initRoomCable };
