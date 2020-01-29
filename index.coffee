# Read style section for settings (e.g. retina scaling, colors)

command: "/usr/local/bin/node -pe 'JSON.stringify(require(\"/Users/joshmu/Google Drive/DB_/signals-db.json\"))'"

refreshFrequency: 1 * 60 * 1000

render: (output) -> 
  html = '<table>'
  data = JSON.parse(output).slice(-72).reverse()
  data.forEach((d, i) ->
    html += """
      <tr>
        <td class="#{d.invest_btcusd.replace /\s/g, "-"}" style="animation-delay: #{i * 100}ms"></td>
        <td class="#{d.invest_ethbtc.replace /\s/g, "-"}" style="animation-delay: #{i * 100 + 33}ms"></td>
        <td class="#{d.invest_ethusd.replace /\s/g, "-"}" style="animation-delay: #{i * 100 + 66}ms"></td>
      </tr>
   """ 
  )
  html += '</table>'
  """
    <div id="hourlySignalsChart">#{html}</div>
  """

update: (output) ->

style: """
  /* Settings */
  opacity = 0.6 

  /* Styles (mod if you want) */
  top: 230px
  left: 0px
  opacity: opacity

  table
    -webkit-border-vertical-spacing: 1px
    -webkit-border-horizontal-spacing: 1px

  @keyframes sigAnim
    0%  
      opacity: 0
    90%
      opacity: 0
    100% 
      opacity: 1 

  td
    width: 6px
    height: 3px
    animation-name: sigAnim
    animation-duration: 10s

  .strong-buy
      background-color: green 

  .buy
      background-color: #9DC284

  .neutral
      background-color: #F9E8B8

  .sell
      background-color: #EDC9C4

  .strong-sell
      background-color: #DE9D9B

"""
