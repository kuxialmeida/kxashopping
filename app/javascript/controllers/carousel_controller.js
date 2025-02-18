import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["wrapper"]
  static values = { autoplayInterval: { type: Number, default: 3000 } } // 3000ms = 3 seconds

  connect() {
    this.currentIndex = 0
    this.totalSlides = this.wrapperTarget.children.length
    this.update()
    this.startAutoplay()
  }

  disconnect() {
    if (this.autoplayTimer) {
      clearInterval(this.autoplayTimer)
    }
  }

  next() {
    if (this.currentIndex < this.totalSlides - 1) {
      this.currentIndex++
    } else {
      this.currentIndex = 0 // Loop back to start
    }
    this.update()
  }

  prev() {
    if (this.currentIndex > 0) {
      this.currentIndex--
    } else {
      this.currentIndex = this.totalSlides - 1 // Loop to last slide
    }
    this.update()
  }

  update() {
    const offset = -this.currentIndex * 100
    this.wrapperTarget.style.transform = `translateX(${offset}%)`
  }

  startAutoplay() {
    this.autoplayTimer = setInterval(() => {
      this.next()
    }, this.autoplayIntervalValue)
  }
}
