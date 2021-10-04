// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require ("jquery")
require("chartkick")
require("chart.js")
import "chartkick/chart.js"
import Chart from 'chart.js/auto'
import ApexCharts from "apexcharts";
window.ApexCharts = ApexCharts;

document.addEventListener('turbolinks:load', () => {
  var ctx = document.getElementById('myChart').getContext('2d');
  var myChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: JSON.parse(ctx.canvas.dataset.labels),
    datasets: [{
      data: JSON.parse(ctx.canvas.dataset.data),
    }]
  },
  });
})

const inputsZipcode = $('#address, #address_comp, #neighborhood, #city, #state');
const validateZipcode = /^[0-9]{8}$/;

function clean_zipcode_form(alert) {
  if (alert !== undefined) {
    console.log(alert);
  }
  inputsZipcode.val('');
}

function fetchInfosFromZipcode(url) {
  $.ajax({
    url: url,
    success: function(data) {
      console.log(data);
      if (!("erro" in data)) {
        if (Object.prototype.toString.call(data) === '[object Array]') {
          const data = data[0];
        }
        $('#address').val(data['logradouro']);
        $('#address_comp').val(data['complemento']);
        $('#neighborhood').val(data['bairro']);
        $('#city').val(data['localidade']);
        $('#state').val(data['uf']);
      } else {
        clean_zipcode_form("CEP não encontrado.");
      }
    },
    timeout: 5000,
  });
}

const addressAutocomplete = () => {
  document.addEventListener("DOMContentLoaded", (event) => {
    $('#zipcode').on('keyup', function(e) {
      const cep = $('#zipcode').val().replace(/\D/g, '');
      if (cep !== "" && validateZipcode.test(cep)) {
        inputsZipcode.val('...');
        fetchInfosFromZipcode('https://viacep.com.br/ws/' + cep + '/json/');
      } else {
        clean_zipcode_form(cep == "" ? undefined : "formato de CEP inválido.");
      }
    });
  });
}

export { addressAutocomplete };