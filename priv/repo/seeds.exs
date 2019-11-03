# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TimelogApp.Repo.insert!(%TimelogApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
import Ecto.Query
alias TimelogApp.Repo
alias TimelogApp.Users.User
alias TimelogApp.Timesheets.Timesheet
alias TimelogApp.Timelogs.Timelog

# all = TimelogApp.Users.get_user_by_email("nano@example.com")
# IO.inspect(all)

# tasks = TimelogApp.Timelogs.get_timelog!(1)
# IO.puts("fdjahflksdj;lf---------------------------")
# IO.inspect(tasks)

Repo.insert!(%Timelog{approved: false, desc: "morning task", name: "Task5", user_id: 1, manager_id: 1})
# Repo.insert!(%Request{approved: false, desc: "morning task", name: "Task6", user_id: 1, handles_id: 6})
# Repo.insert!(%User{name: "part", email: "twisha@example.com", manager: true})

# query = from p in Timesheet,
#      select: p
# Repo.all(query)
# Ecto.Schema.t()

# query = from(u in Manager, update: [set: [manager: true]])
# Repo.all(query)

# task = TimelogApp.Timelogs.get_timelog_name("Task1")
# IO.inspect(task)

# query = from u in "timelogs",
        #   select: u
# IO.inspect(Repo.all(query))
# Ecto.Schema

# post = Ecto.Changeset.change(%User{}, name: "Hello", email: "World")
# timelog = Ecto.Changeset.change(%Timelog{}, approved: false, desc: "afternoon task", name: "Task2")
# post_with_comments = Ecto.Changeset.put_assoc(timelog, :user, all) # Main Step
# Repo.insert!(post_with_comments)
# Repo.insert!(%User{name: "Bob", email: "bob@example.com"})