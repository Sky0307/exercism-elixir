defmodule FreelancerRates do
  @daily_rate 8.0
  @monthly_billable_days 22

  def daily_rate(hourly_rate), do: hourly_rate * @daily_rate

  def apply_discount(before_discount, discount), do: before_discount * (100.0 - discount) / 100.0

  def monthly_rate(hourly_rate, discount) do
    hourly_rate
    |> Kernel.*(@monthly_billable_days)
    |> daily_rate()
    |> apply_discount(discount)
    |> Float.ceil()
    |> trunc()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_rate_with_discount =
      hourly_rate
    |> daily_rate()
    |> apply_discount(discount)

    budget
    |> Kernel./(daily_rate_with_discount)
    |> Float.floor(1)
  end
end
