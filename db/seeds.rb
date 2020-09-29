# Planを作ったあと、Plan名はjsonに無いのでデータベースに保存できないためPlan名はここで固定
planname = 'P Plan'

# Plan作成
plan = Stripe::Plan.create(
  # productを作らずにnameだけでPlanを作る場合のやり方
  :product => {
    :name => planname
  },
  :amount => 1000,
  :currency => 'jpy',
  :interval => 'month',
  # :usage_type='licensed', #Subscription開始時に請求を開始するタイプ(即時決済)(前払い性)
  # これがなくてもデフォルトで'licensed'になる
  # 'Metered'は各期間の終わりにその期間分を請求することができる。利用料に応じて請求できるタイプ
)



# Planを作ることができていたら
if plan != nil

  puts plan
  puts plan.id
  puts planname# Plan名はjsonに無い
  puts plan.amount
  puts plan.currency
  puts plan.interval
  
  # データベースに保存
  Plan.create(
    id: 1,# Planが重複しないように1に固定
    stripe_plan_id: plan.id,
    name: planname,# Plan名はjsonに無いので直接保存
    amount: plan.amount,
    currency: plan.currency,
    interval: plan.interval
  )
end
