local path = "desktops/user1"

return {
    path = path,
    name = "user1",
    theme = "dark",
    background = {
        t = "color", color = {0.25,0.35,0.65}
    },
    avalablePrograms = {"remotedesktop","inbox","bank"},
    desktop = {
        {
            name = "to delete",
            type = "folder",
            {
                name = "bank details (user1)",
                type = "text",
                content = "hi mate, reminder to switch all the bank details to the new account, the old one is compromised.\n\ncheers,\n\n- boss"
            },
            {
                name = "bank details (savings)",
                type = "text",
                content = "hey, just quickly, what are the details for this account, i can not remember.\n\n- user1"
            },
            {
                name = "new document",
                type = "text",
                content = ""
            },
            {
                name = "new folder",
                type = "folder",
                {
                    name = "bug report",
                    type = "image",
                    img = love.graphics.newImage(path.."/bug.png")
                }
            },
            {
                name = "dwwf",
                type = "folder"
            }
        },
        {
            pos = {1,6},
            name = "balance",
            type = "text",
            content = {
                {"hey mate, as requested here is the balance of all the accounts in our name,\n\nremember that the ann0nymous has an eye on our 2nd account, i've transfered it to a new account:"},
                {"- savings: £22.54\n- user1: £1.23 (comprimised)\n- user1_newaccount: £9,640.50","left"},
                {"cheers,\n\n- boss"}
            },
        },
        {
            pos = {2,3},
            name = "inbox",
            type = "program",
            program = "inbox",
            icon = "inbox",
        },
        {
            pos = {3,4},
            name = "bank",
            type = "program",
            program = "bank",
            icon = "bank",
        },
        {
            pos = {13,1},
            name = "goal",
            type = "text",
            content = "generic name but trust me, this guy is loaded.\n\nget access to his bank details and send everything to me:\n\nmy account number: 12345678\nmy sort code: 39-27-11\n\n- ann0nymous112",
        }
    },
    bin = {
        {
            name = "new folder",
            type = "folder"
        },
        {
            name = "email",
            type = "text",
            content = {{"(incase of memory loss)"},{"the password is iloveboss22","left"}}
        }
    },
    emails = {
        {
            email = "user1@inbox.com",
            password = "iloveboss22",
            emails = {
                {
                    from = "boss23@inbox.com",
                    to = "user1@inbox.com",
                    subject = "re: bank details - savings",
                    content = "the password was 123456, but the account is no longer in use and the funds have been moved to the new account.\n\n- boss",
                    reference = {
                        from = "user1@inbox.com",
                        to = "boss23@inbox.com",
                        subject = "bank details - savings",
                        content = "hey, just quickly, what are the details for this account, i can not remember.\n\n- user1",
                    }
                },
                {
                    from = "noreply@inbox.com",
                    to = "user1@inbox.com",
                    subject = "welcome to inbox.com",
                    content = "welcome to inbox.com, the best email service in the world, we hope you enjoy your stay.\n\n- the inbox.com team",
                }
            },
            _emails = {
                {
                    from = "unknown",
                    to = "unknown",
                    subject = "unknown",
                    content = "unknown"
                },
            }
        }
    },
    banks = {
        {
            name = "savings",
            password = "123456",
            email = "boss23@inbox.com",
            closed = true,
        },
        {
            name = "user1",
            password = "d839j39vjn30jk40k330", -- no one can guess this
            email = "boss23@inbox.com",
            closed = true
        },
        {
            name = "user1_newaccount",
            password = "284733",
            email = "user1@inbox.com",
            closed = false,
            identifier = "user1_newaccount_1"
        }
    }
}