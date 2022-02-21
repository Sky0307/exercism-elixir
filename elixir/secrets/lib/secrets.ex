defmodule Secrets do
  require Bitwise

  def secret_add(secret), do: &(&1 + secret)

  def secret_subtract(secret), do: &(&1 - secret)

  def secret_multiply(secret), do: &Kernel.*(&1, secret)

  def secret_divide(secret), do: &div(&1, secret)

  def secret_and(secret), do: &Bitwise.&&&(&1, secret)

  def secret_xor(secret), do: &Bitwise.^^^(&1, secret)

  def secret_combine(secret_function1, secret_function2) do
    &(secret_function1.(&1)
      |> secret_function2.())
  end
end
