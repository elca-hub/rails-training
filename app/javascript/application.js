// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

async function gpaCountUp(gpaValue) {
    function fetchTime(t, s, x) {
        const y = Math.sqrt(1 - ((x - t) / t) ** 2) * s

        return Math.ceil(y * 100) / 100
    }

    const duration = 5000

    const startTime = performance.now()

    return new Promise((resolve) => {
        const targetDom = document.getElementById('viewGpa')

        const textGpa = gpaValue.toFixed(2)

        const countUp = () => {
            const viewTimeNum = fetchTime(duration, textGpa, performance.now() - startTime)

            
            if (viewTimeNum >= gpaValue) {
                targetDom.innerText = textGpa

                resolve(true)
                return
            }

            targetDom.innerText = viewTimeNum.toFixed(2)
            requestAnimationFrame(countUp)
        }

        requestAnimationFrame(countUp)
    })
}

window.addEventListener('turbo:load', async () => {
    const gpa = document.querySelector('[data-gpa]')
    if (gpa !== null) {
        const gpaValue = parseFloat(gpa.dataset.gpa)

        const isDone = await gpaCountUp(gpaValue)

        await new Promise((resolve) => { setTimeout(resolve, 1000) })

        if (isDone && gpaValue > 3.3) {
            const comment = document.getElementById('comment')
            comment.innerText = '学長褒章'
            comment.style.opacity = 1
        }
    }
})
