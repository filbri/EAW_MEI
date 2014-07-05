# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140704202934) do

  create_table "alunos", force: true do |t|
    t.string   "nome"
    t.date     "dataNasc"
    t.integer  "nBI"
    t.string   "morada"
    t.string   "cp"
    t.string   "localidade"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "direcs", force: true do |t|
    t.string   "nome"
    t.date     "dataNasc"
    t.integer  "nBI"
    t.string   "morada"
    t.string   "cp"
    t.string   "localidade"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disciplinas", force: true do |t|
    t.string   "designacao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "encarregados", force: true do |t|
    t.string   "nome"
    t.date     "dataNasc"
    t.integer  "nBI"
    t.string   "morada"
    t.string   "cp"
    t.string   "localidade"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercicios", force: true do |t|
    t.string   "designacao"
    t.string   "enunciado"
    t.date     "data"
    t.integer  "disciplina_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mensagens", force: true do |t|
    t.string   "remetente"
    t.string   "destinatario"
    t.string   "assunto"
    t.string   "mensagem"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nota", force: true do |t|
    t.integer  "aluno_id"
    t.integer  "exercicio_id"
    t.integer  "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profs", force: true do |t|
    t.string   "nome"
    t.date     "dataNasc"
    t.integer  "nBI"
    t.string   "morada"
    t.string   "cp"
    t.string   "localidade"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "turmas", force: true do |t|
    t.string   "designacao"
    t.integer  "aluno_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
