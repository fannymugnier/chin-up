import consumer from "./consumer";

const initRoomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "RoomChannel", id: id }, {
      received(data) {
        console.log(data)
        // if data == message
        messagesContainer.insertAdjacentHTML('beforeend', data);
        messagesContainer.scrollTop = messagesContainer.scrollHeight;


        // # if data is sondage
        //   replaceHTML
      },
    });
  }
}

export { initRoomCable };
