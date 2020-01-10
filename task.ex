defmodule Person do
  def receivables(person) do
    # all
  end

  def receivables(person, other_person) do
  end

  def total_owed(from_person, to_person) do
  end
end

Person.total_owed(ola, kelly)

defmodule BSocial do
  """
  Title: Lunch
  Spend:
        Kelly: 5.50
        Sam: 10
        Ola: 15
        Tommen: 10
        Sandy: 5
  Total: 45.5
  Payer: Tommen

  Title: Movie
  Spend:
        Kelly: 10
        Sam: 10
        Ola: 10
        Tommen: 10
        Sandy: 10
  Total: 50
  Payer: Kelly
  """

  %{  }

  # uniq names in (spend + payer)
  # add the amounts
  excursions = [
    %{
      title: "Lunch",
      spend: [
        %{name: "Kelly", amount: 5.50},
        %{name: "Sam", amount: 10},
        %{name: "Ola", amount: 15},
        # this is included in the total
        %{name: "Tommen", amount: 10},
        %{name: "Sandy", amount: 5}
      ],
      total: 45.5,
      payer: %{name: "Tommen", amount: 45.5}
    },
    %{
      title: "Movie",
      spend: [
        # this is included in the total
        %{name: "Kelly", amount: 10},
        %{name: "Sam", amount: 10},
        %{name: "Ola", amount: 10},
        %{name: "Tommen", amount: 10},
        %{name: "Sandy", amount: 10}
      ],
      total: 50,
      payer: %{name: "Kelly", amount: 50}
    }
  ]

  ledger = [
    %{ sam: 10, kelly: -10, ola: 0, tommen: 0, sandy: 0 },
    %{ sam: 10, kelly: -20, ola: 10, tommen: 0, sandy: 0 },
    %{ sam: 10, kelly: -30, ola: 10, tommen: 10, sandy: 0 },
    %{ sam: 10, kelly: -40, ola: 10, tommen: 10, sandy: 10 },
    %{ sam: 10, kelly: -34.50, ola: 10, tommen: 4.5, sandy: 10 },
    %{ sam: 20, kelly: -34.50, ola: 10, tommen: -5.5, sandy: 10 },
    %{ sam: 20, kelly: -34.50, ola: 25, tommen: -20.5, sandy: 10 },
    %{ sam: 20, kelly: -34.50, ola: 25, tommen: -25.5, sandy: 15 },

#
    %{ sam: 20, kelly: -34.50, ola: 0, tommen: -.5, sandy: 15 },
    %{ sam: 20, kelly: -35, ola: 0, tommen: 0, sandy: 15 },
    %{ sam: 0, kelly: -15, ola: 0, tommen: 0, sandy: 15 },
    %{ sam: 0, kelly: 0, ola: 0, tommen: 0, sandy: 0 },
  ]

  ola -> tommen
  kelly -> tommen
  sam -> kelly
  sandy -> kelly




  general_ledger = [
    # Every row contains every person??
    %{creditor: "Kelly", debitor: "Kelly", amount: 10},
    %{creditor: "Kelly", debitor: "Sam", amount: 10},
    %{creditor: "Kelly", debitor: "Ola", amount: 10},
    %{creditor: "Kelly", debitor: "Tommen", amount: 10},
    %{creditor: "Kelly", debitor: "Sandy", amount: 10}
  ]


[
  [square, circle, triangle],
  [area, perimeter, circumference]
]

  [
    # add a column
    [x, y, z],
    # add a row -> expression problem!!
    []
  ]

  # option
  Person.total_debts()
  Person.total_receivables()
  Person.x_owes_y()

  # another option
  Ledger.total_debts_for(ledger, person)
  # but since when??
  Ledger.total_receivables_for(ledger, person)
  Ledger.x_owes_y(ledger, x, y)

  # simplify? / bookkeep. Stack overflow answer ?

  people =
    [
      %{name: "Tommen", debts: [%{to: "Kelly", amount: 50}], receivables: []},
      %{name: "Kelly", debts: [], receivables: []},
      %{name: "Ola", debts: [], receivables: []},
      %{name: "Sandy", debts: [], receivables: []},
      %{name: "Sam", debts: [], receivables: []}
    ]
    |> Enum.map(fn person ->
      update_receivables(person, excursions)
      |> update_debts(excursions)

      # What does this do? If a owes c and c owes a, it cancels the debt out
      # this is probably just double entry accounting though.
      # |> simplify()
    end)

  def update_receivables(person, excursions) do
    Enum.reduce(excursions, person, fn
      # If we are the payer, we don't need to include it, as there is no debt to ourselves.
      %{payer: %{name: ^person.name}}, person_acc ->
        person_acc

      %{spend: spends}, person_acc ->
        receivables =
          Enum.map(spends, fn spend ->
            receivable = %{for: title, amount: spend.amount, debtor: spend.name}
          end)

        %{person_acc | receivables: person_acc.receivables ++ receivables}
    end)
  end

  def update_debts(person, excursions) do
    Enum.reduce(excursions, person, fn
      excursion, person_acc ->
        %{amount: amount} =
          excursion.spend |> Enum.find(fn spend -> spend.name == person.name end)

        debt = %{from: person.name, creditor: excursion.payer, amount: spend.amount}
        %{person_acc | debts: person.debts ++ [debt]}
    end)
  end
end
