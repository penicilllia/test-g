document.addEventListener('turbolinks:load', function() {
  if (!window.location.href.includes("sign_up")) {
    return;
  }
  
  var greenAlert = document.querySelector('.alert-green')
  var redAlert = document.querySelector('.alert-red')

  var compare = document.querySelector('.compare-field')
  var input_var = document.querySelector('.input-field')
  
  input_var.addEventListener('input', updateValue)

  function updateValue() 
  {
    if (input_var.value === '') 
    {
      greenAlert.classList.add('hide')
      redAlert.classList.add('hide')
      return
    }
    if (compareVal(compare.value, input_var.value)) 
    {
      greenAlert.classList.remove('hide')
      redAlert.classList.add('hide')
    } else {
      greenAlert.classList.add('hide')
      redAlert.classList.remove('hide')
    }
  }
  
})
  
function compareVal(val1, val2) {
    if (val2 == val1) 
    {
      return true
    } else {
      return false
    }
}
