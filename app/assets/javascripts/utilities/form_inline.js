document.addEventListener('turbolinks:load', function() {
    var controls = document.querySelectorAll('.form-inline-link')

    if (controls.length) {
        for (var i = 0; i < controls.length; i++) {
            controls[i].addEventListener('click', formInlineLinkHandler)
        }
    }

    var errors = document.querySelector('.recource-errors')

    if (errors) {
        var recourceId = errors.dataset.recourceId
        formInlineHandler(recourceId)
    }
})

function formInlineLinkHandler(evt) {
    evt.preventDefault()
    var testId = this.dataset.testId
    formInlineHandler(testId)
}

function formInlineHandler(testId) {
    var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
    var testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
    var formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

    console.log(testTitle)
    console.log(link)
    console.log(formInline)
    console.log(testId)

    if (formInline.classList.contains('hide')) {
        testTitle.classList.add('hide')
        formInline.classList.remove('hide')
        link.textContent = 'Cancel'
    } else {
        testTitle.classList.remove('hide')
        formInline.classList.add('hide')
        link.textContent = 'Edit'
    }
}
