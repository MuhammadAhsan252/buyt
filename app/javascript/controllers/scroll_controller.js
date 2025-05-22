import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("connected");
    this.userId = this.element.dataset.scrollUserId;
    this.userType = this.element.dataset.scrollUserType;

    this.markOutgoingMessages();
    const messages = document.getElementById("messages");

    // Create a MutationObserver to watch for new messages
    this.observer = new MutationObserver(() => {
      this.resetScroll();
      this.markOutgoingMessages();
    });

    // Start observing the messages element for child node changes
    this.observer.observe(messages, { childList: true });

    // Initial scroll reset
    this.resetScroll();
    this.markOutgoingMessages();
  }

  disconnect() {
    // Disconnect the MutationObserver when the controller is disconnected
    if (this.observer) {
      this.observer.disconnect();
    }
  }

  resetScroll() {
    const messages = document.getElementById("messages");
    messages.scrollTop = messages.scrollHeight - messages.clientHeight;
  }

  markOutgoingMessages() {
    const selector = `[data-sender-id="${this.userId}"][data-sender-type="${this.userType}"]`;

    this.element.querySelectorAll(selector).forEach((el) => {
      el.classList.add("outgoing");
    });
  }
}
