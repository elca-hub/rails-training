// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

async function gpaCountUp(gpaValue) {
    return new Promise((resolve) => {
        const targetDom = document.getElementById('viewGpa')

        const startTime = performance.now()

        const getDecimalPointLength = (n) => {
            return (String(n).split('.')[1] || '').length
        }

        const deciamlPointLength = getDecimalPointLength(gpaValue)

        let duration = 1500

        const countUp = () => {
            const elapsed = performance.now() - startTime
            const countValue = (((elapsed / duration) * gpaValue)).toFixed(deciamlPointLength)

            if (countValue >= gpaValue) {
                targetDom.innerText = gpaValue.toLocaleString()
                resolve(true)
            } else {
                targetDom.innerText = parseFloat(countValue).toLocaleString()
                requestAnimationFrame(countUp)
            }
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
