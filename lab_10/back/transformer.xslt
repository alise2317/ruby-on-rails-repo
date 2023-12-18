<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">

<!-- как сюда передавать значения из контроллера? -->

<root>
  <p>Количество найденных значений</p>
  <p id="result"><%= @result %></p>
  <p>Найденные в заданном промежутке автоморфные числа</p>
  <p id="solve"></p>
  <table border="1">
    <tr>
      <th>Счётчик автоморфных чисел</th>
      <th>Исходное число</th>
      <th>Квадрат числа</th>
    </tr>
    <% @solve.each do |row| %>
      <tr>
        <% row.each do |value| %>
          <td>
            <%= value %>
          </td>
        <% end %>
      </tr>
    <% end %>
  </table>
  <!-- <%= link_to "Повторить вычисления", :automorf_number_input %> -->
</root>

</xsl:template>
</xsl:transform>  